import ballerina/http;

type Album readonly & record {|
    string title;
    string artist;
|};

table<Album> key(title) albums = table [
    {title: "Front End", artist: "HTML/JavaScript"},
    {title: "Athentication", artist: "Asgardeo"},
    {title: "API/Backend Logic", artist: "Ballerina"},
     {title: "Integrated with", artist: "Connection"}
];

service / on new http:Listener(9090) {

    resource function get albums() returns Album[] {
        return albums.toArray();
    }

    resource function post albums(Album album) returns Album {
        albums.add(album);
        return album;
    }

    
}
