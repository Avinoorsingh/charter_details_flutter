class AddCharterModel{
String? name;
String? email;
String? address1;
String? address2;
String? state;
String? city;
String? country;
String? website;
String? contactPerson;
String? phoneNumber;
// "{
// ""chartererDetails"": {
// ""name"": ""xyz"",
// ""email"": ""xyz@abc.com"",
// ""address1"": ""test address1"",
// ""address2"": """",
// ""state"": """",
// ""city"": """",
// ""country"": ""India"",
// ""website"": ""https://www.google.com"",
// ""contactPerson"": ""XYZ"",
// ""phoneNumber"": ""4234234324""
// }"

AddCharterModel({this.name,this.email,this.address1,this.address2,this.state,this.city,this.country,this.website,this.contactPerson,this.phoneNumber});

//getting data from server
factory AddCharterModel.fromMap(map){
  return AddCharterModel(
    name: map['name'],
    email: map['email'],
    address1: map['address1'],
    address2: map['address2'],
    state: map['state'],
    city: map['city'],
    country: map['country'],
    website: map['website'],
    contactPerson: map['contactPerson'],
    phoneNumber: map['phoneNumber'],
  );
}

//sending data to server
Map<String, dynamic> toMap(){
  return {
    'name': name,
    'email': email,
    'address1': address1,
    'address2': address2,
    'state': state,
    'city': city,
    'country': country,
    'website': website,
    'contactPerson':contactPerson,
    'phoneNumber': phoneNumber,
  };
}

}