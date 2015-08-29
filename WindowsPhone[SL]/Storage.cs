// Write text inside a file
StorageFile file = await ApplicationData.Current.LocalFolder.CreateFileAsync("file.txt", CreationCollisionOption.ReplaceExisting);
IRandomAccessStream randomAccessStream = await file.OpenAsync(FileAccessMode.ReadWrite);  
using (DataWriter writer = new DataWriter(randomAccessStream.GetOutputStreamAt(0)))     
{         
	writer.WriteString("Sample text");         
	await writer.StoreAsync();    
}



// Read a text from a file
StorageFile file = await ApplicationData.Current.LocalFolder.GetFileAsync("file.txt");
IRandomAccessStream randomAccessStream = await file.OpenAsync(FileAccessMode.Read);  
using (DataReader reader = new DataReader(randomAccessStream.GetInputStreamAt(0)))     
{         
	uint bytesLoaded = await reader.LoadAsync((uint)randomAccessStream.Size);
    string readString = reader.ReadString(bytesLoaded);
    MessageBox.Show(readString);     
} 