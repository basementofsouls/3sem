#include "winsock2.h"
#include "windows.h"
#include "time.h"
#include "stdio.h"

#pragma comment(lib,"ws2_32.lib") //For winsock
#pragma comment(lib , "iphlpapi.lib") 

#define MAX_ADAPTER_NAME_LENGTH 256
#define MAX_ADAPTER_DESCRIPTION_LENGTH 128
#define MAX_ADAPTER_ADDRESS_LENGTH 8

//Necessary Structs
typedef struct
{
	char String[4 * 4];
} IP_ADDRESS_STRING, * PIP_ADDRESS_STRING, IP_MASK_STRING, * PIP_MASK_STRING;

typedef struct _IP_ADDR_STRING
{
	struct _IP_ADDR_STRING* Next;
	IP_ADDRESS_STRING IpAddress;
	IP_MASK_STRING IpMask;
	DWORD Context;
} IP_ADDR_STRING, * PIP_ADDR_STRING;

typedef struct _IP_ADAPTER_INFO
{
	struct _IP_ADAPTER_INFO* Next;
	DWORD           ComboIndex;
	char            AdapterName[MAX_ADAPTER_NAME_LENGTH + 4];
	char            Description[MAX_ADAPTER_DESCRIPTION_LENGTH + 4];
	UINT            AddressLength;
	BYTE            Address[MAX_ADAPTER_ADDRESS_LENGTH];
	DWORD           Index;
	UINT            Type;
	UINT            DhcpEnabled;
	PIP_ADDR_STRING CurrentIpAddress;
	IP_ADDR_STRING  IpAddressList;
	IP_ADDR_STRING  GatewayList;
	IP_ADDR_STRING  DhcpServer;
	BOOL            HaveWins;
	IP_ADDR_STRING  PrimaryWinsServer;
	IP_ADDR_STRING  SecondaryWinsServer;
	time_t          LeaseObtained;
	time_t          LeaseExpires;
} IP_ADAPTER_INFO, * PIP_ADAPTER_INFO;


//Functions
void loadiphlpapi();
void GetMacAddress(unsigned char*, struct in_addr);

//Loads from Iphlpapi.dll
typedef DWORD(WINAPI* psendarp)(struct in_addr DestIP, struct in_addr SrcIP, PULONG pMacAddr, PULONG PhyAddrLen);
typedef DWORD(WINAPI* pgetadaptersinfo)(PIP_ADAPTER_INFO pAdapterInfo, PULONG pOutBufLen);

int main()
{
	unsigned char mac[6];
	struct in_addr srcip;
	char ip_address[32];

	WSADATA firstsock;

	if (WSAStartup(MAKEWORD(2, 2), &firstsock) != 0)
	{
		printf("\nFailed to initialise winsock.");
		printf("\nError Code : %d", WSAGetLastError());
		return 1;	//Return 1 on error
	}

	loadiphlpapi();

	//Ask user to select the device he wants to use
	printf("Enter the ip address : ");
	scanf("%s", ip_address);
	srcip.s_addr = inet_addr(ip_address);

	//Get mac addresses of the ip
	GetMacAddress(mac, srcip);
	printf("Selected device has mac address : %.2X-%.2X-%.2X-%.2X-%.2X-%.2X", mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
	printf("\n");

	return 0;
}

//2 functions
psendarp SendArp;
pgetadaptersinfo GetAdaptersInfo;



/*
	Get the mac address of a given ip
*/
void GetMacAddress(unsigned char* mac, struct in_addr destip)
{
	DWORD ret;
	struct in_addr srcip;
	ULONG MacAddr[2];
	ULONG PhyAddrLen = 6;  /* default to length of six bytes */
	int i;

	srcip.s_addr = 0;

	//Send an arp packet
	ret = SendArp(destip, srcip, MacAddr, &PhyAddrLen);

	//Prepare the mac address
	if (PhyAddrLen)
	{
		BYTE* bMacAddr = (BYTE*)&MacAddr;
		for (i = 0; i < (int)PhyAddrLen; i++)
		{
			mac[i] = (char)bMacAddr[i];
		}
	}
}