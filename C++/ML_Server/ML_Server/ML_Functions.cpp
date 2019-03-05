#include "ML_Functions.h"
#include <string>
#include <Poco\NumberParser.h>
#include <openssl\sha.h>
#include <sstream>
#include <iomanip>
#include <wincrypt.h>


void ML::CallExtension(char *output, const int &output_size, 
                       const char *function) {
  const std::string params(function);
  int Fnc_ID;
  if ( Poco::NumberParser::tryParse(params.substr(0, 1), Fnc_ID) ) {
    switch (Fnc_ID) {
      case 1: {
        const std::string::size_type found = params.find(":");
        const std::string param = params.substr(found + 1);
        const std::string salt = ML::ML_CreateSalt();
        const std::string return_s(ML::ML_Sha384(param + salt) + ":" + salt);
        strncpy_s(output, output_size, return_s.c_str(), _TRUNCATE);
        break;
      }
    }
  }
  return;
}

std::string ML::ML_CreateSalt() {
  HCRYPTPROV phProv;
  const DWORD size = 48;
  BYTE buffer[size] = {};

  if ( !CryptAcquireContext(&phProv, NULL, NULL, PROV_RSA_FULL, 
                            CRYPT_VERIFYCONTEXT | CRYPT_SILENT)) {
    return ML::ML_Error(GetLastError());
  }
  if ( !CryptGenRandom(phProv, size, buffer) ) {
    return ML::ML_Error(GetLastError());
  }
  if ( !CryptReleaseContext(phProv, 0) ) {
    return ML::ML_Error(GetLastError());
  }

  std::string salt;
  std::stringstream ss;
  for (int i = 0; i < size; ++i) {
    ss << std::hex << (static_cast<unsigned int>(buffer[i]));
  }
  ss >> salt;
  return salt;
}

std::string ML::ML_Sha384(const std::string str) {
  unsigned char hash[SHA384_DIGEST_LENGTH];
  SHA512_CTX ctx;
  SHA384_Init(&ctx);
  SHA384_Update(&ctx, str.c_str(), str.size());
  SHA384_Final(hash, &ctx);

  std::stringstream ss;
  for (int i = 0; i < SHA384_DIGEST_LENGTH; i++) {
    ss << std::hex << std::setw(2) << std::setfill('0') << (int)hash[i];
  }

  return ss.str();
}

std::string ML::ML_Error(int Error) {
  LPSTR messageBuffer = NULL;

  size_t size = FormatMessageA(FORMAT_MESSAGE_ALLOCATE_BUFFER |
                               FORMAT_MESSAGE_FROM_SYSTEM | 
                               FORMAT_MESSAGE_IGNORE_INSERTS, NULL, Error,
                               MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                               (LPSTR)&messageBuffer, 0, NULL);

  std::string message(messageBuffer, size);
  LocalFree(messageBuffer);

  return message;
}