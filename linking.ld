ENTRY(_start)

MEMORY
{
	BOOT_CODE(RWX): ORIGIN = 0x7c00, LENGTH = 0x200
	BOOT_STAC(W): ORIGIN = 0x5b00, LENGTH = 0x1500
	BOOT_DATA(W): ORIGIN = 0x7e00, LENGTH = 0x3000
}

SECTIONS
{
	.boot :
	{
		*(.boot_code)
	} > BOOT_CODE

	.boot_d :
	{
		*(.boot_data)
	} > BOOT_DATA
}
