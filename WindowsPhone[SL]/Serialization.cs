// XML Serialization
DataContractSerializer serializer = new DataContractSerializer(typeof(List<Person>));
StorageFile file = await ApplicationData.Current.LocalFolder.CreateFileAsync("people.xml");
IRandomAccessStream randomAccessStream = await file.OpenAsync(FileAccessMode.ReadWrite);  
using (Stream stream = randomAccessStream.AsStreamForWrite())     
{         
	serializer.WriteObject(stream, people);         
	await stream.FlushAsync();     
}



// XML Deserialization
StorageFile file = await ApplicationData.Current.LocalFolder.GetFileAsync("people.xml");
DataContractSerializer serializer = new DataContractSerializer(typeof(List<Person>));
IRandomAccessStream randomAccessStream = await file.OpenAsync(FileAccessMode.Read);  
using (Stream stream = randomAccessStream.AsStreamForRead())     
{         
	List<Person> people = serializer.ReadObject(stream) as List<Person>;     
} 