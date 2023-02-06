#include <windows.h>
#include <iphlpapi.h> 
#include <iostream> 
#include <iomanip> 

int main(int argc, char** argv) {
	if (argc < 2) {
		std::cerr << "Usage: " << argv[0] << " <IP address>\n";
		return EXIT_FAILURE;
	}

	char MacAddr[6];
	ULONG size = sizeof(MacAddr);

	SendARP(inet_addr(argv[1]), inet_addr("0.0.0.0"), MacAddr, &size);

	std::cout << "The MAC address is: ";
	for (unsigned char c : MacAddr)
		std::cout << std::setw(2) << std::setprecision(2) << std::setfill('0') << std::hex << (unsigned)c << " ";
}