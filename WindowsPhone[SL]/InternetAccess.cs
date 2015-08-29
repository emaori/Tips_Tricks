// Checking the Internet connection
if (DeviceNetworkInformation.IsNetworkAvailable)     
{         
	MessageBox.Show("You are connected to Internet");         
	//Perform network operations.     
}     
else     
{         
	MessageBox.Show("You aren't connected to Internet");     
}