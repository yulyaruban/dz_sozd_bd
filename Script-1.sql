create table if not exists Genre (
	genre_id SERIAL primary key,
	genre_name varchar(60) unique,
	description text)
		

create table if not exists Artist (
	artist_id integer primary key,
	artist_name varchar(60) not null)

	
create table if not exists Album (
	album_id serial primary key,
	album_name varchar(60) not null,
	album_year_of_issue integer(4) )

create table if not exists GenreArtist (
	genre_id integer references Genre(genre_id),
	artist_id integer references Artist(artist_id),
	constraint pk primary key (genre_id, artist_id))
	
create table if not exists AlbumArtist (
	album_id integer references Album(album_id),
	artist_id integer references Artist(artist_id),
	constraint pk primary key (album_id, artist_id))

create table if not exists Track (
	track_id serial primary key,
	track_name varchar(60) not null,
	track_duration integer not null,
	album_id integer references Album(album_id))

create table if not exists Collection_of_songs(
	coll_of_songs_id serial primary key,
	collection_name varchar(100) not null,
	collection_year integer(4) )
	
create table if not exists TrackCollection (
	coll_of_songs_id integer references Collection_of_songs(coll_of_songs_id),
	track_id integer references Track(track_id),
	constraint pk primary key (coll_of_songs, track_id)
	)