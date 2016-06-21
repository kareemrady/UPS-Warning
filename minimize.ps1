# Setup a Task in Task Scheduler and set it to run this script

#Start a new TrapRcvr process - note file path will need to be edited if Trap Receiver is installed in another directory
Start-Process "C:\Program Files (x86)\Trap Receiver\TrapRcvr.exe"
sleep -Seconds 1
#importing showWindowAsync library
$sig = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
Add-Type -MemberDefinition $sig -name NativeMethods -namespace Win32
$trapProcess = @(Get-Process "TrapRcvr" -ErrorAction SilentlyContinue)
foreach($process in $trapProcess )
	{ 
	 #Hide TrapReceiver window will only be seen in task manager 
	 $PsID = $process.MainWindowHandle 
	 [Win32.NativeMethods]::ShowWindowAsync($PsID, 0)
	   
	}
	
	



	

