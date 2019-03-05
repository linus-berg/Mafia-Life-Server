#include <iostream>
#include <vector>

class ML {
public:
  void CallExtension(char *output, const int &output_size,
                     const char *function);
private:
  std::string ML_Sha384(const std::string str);
  std::string ML_CreateSalt();
  std::string ML_Error(int Error);
};