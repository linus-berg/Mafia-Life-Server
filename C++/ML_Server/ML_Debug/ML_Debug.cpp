#include "stdafx.h"
#include <iostream>
#include "ML_Functions.h"
#include <string>
#include <windows.h>
#include <vector>
#include <sstream>
#include <regex>

namespace {
	ML *ML_fnc;
};

int main()
{
	std::cout << "Nothing to see here! Enter 0 to exit!" << std::endl;
	std::string returnArma("0");
	if ((std::regex_match("fuckyou@hotmail.com", std::regex("\^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})\$")))){
		
		returnArma = "1";
	}
	else{
		returnArma = "0";
	}
	std::cout << returnArma;
	int j;
	std::cin >> j;
	return 0;
}

