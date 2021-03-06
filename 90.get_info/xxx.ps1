# 
# ESXi Kernel Network Mac addresss  ???? Scripts
#

Param( 
	[Parameter(Mandatory=$True,Position=1)]
	[string]$targetfile
)

$user = "lab\yhkim"
$password = "vmware!0"
$vcenter = "irvc01.iroo.int"
#

# Connect to the vCenter Server
"{0} Connecting to vcenter server..."
Connect-VIServer -Server $vcenter -user $user -password $password -Protocol https


foreach ($f in (import-csv -path $targetfile))
{
	echo "############################################"
 	echo $f.alias 
	echo "############################################"
 	get-vmhost $f.alias | Get-VMHostNetworkAdapter -vmkernel | format-table -Autosize -property Mac, PortGroupName, VMHost, IP 
 
}
Disconnect-VIServer -Server * -Force -confirm:$false
