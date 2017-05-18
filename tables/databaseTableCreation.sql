create table Events
(
	id int identity
		constraint Events_id_pk
			primary key,
	location_id int not null,
	date datetime not null,
	title varchar(255)
)
go

create unique index Events_id_uindex
	on Events (id)
go

create table Attendees
(
	id int identity
		constraint Attendees_ID_pk
			primary key,
	person_id int not null,
	event_id int not null
		constraint Attendees_Events_id_fk
			references Events
)
go

create unique index Attendees_ID_uindex
	on Attendees (id)
go

create table Sponsors
(
	id int identity
		constraint Sponsors_id_pk
			primary key,
	sname varchar(255) not null,
	slevel varchar(255) not null,
	event_id int not null
		constraint Sponsors_Events_id_fk
			references Events,
	table_id int not null
)
go

create unique index Sponsors_id_uindex
	on Sponsors (id)
go

create table Presentations
(
	id int identity
		constraint Presentations_id_pk
			primary key,
	presenter_id int not null,
	course_id int not null
)
go

create unique index Presentations_id_uindex
	on Presentations (id)
go

create table Presenters
(
	id int identity
		primary key,
	attendee_id int not null
		constraint Presenter_Attendees_id_fk
			references Attendees
)
go

create unique index Presenter_id_uindex
	on Presenters (id)
go

alter table Presentations
	add constraint Presentations_Presenter_id_fk
		foreign key (presenter_id) references Presenters
go

create table Organizers
(
	id int identity
		primary key,
	attendee_id int not null
		constraint Organizer_Attendees_id_fk
			references Attendees
)
go

create unique index Organizer_id_uindex
	on Organizers (id)
go

create table Raffles
(
	id int identity
		primary key,
	sponsor_id int not null
		constraint Raffle_Sponsors_id_fk
			references Sponsors
)
go

create unique index Raffle_id_uindex
	on Raffles (id)
go

create table Gifts
(
	gift_name varchar(255) not null,
	sponsor_id int not null
		constraint Gifts_Sponsors_id_fk
			references Sponsors,
	id int identity
		primary key
)
go

create unique index Gifts_id_uindex
	on Gifts (id)
go

create table Tracks
(
	id int identity
		primary key,
	area varchar(255) not null
)
go

create unique index Tracks_id_uindex
	on Tracks (id)
go

create table Persons
(
	first varchar(255) not null,
	last varchar(255) not null,
	email varchar(255) not null,
	id int identity
		primary key,
	address_id int not null
)
go

create unique index Persons_id_uindex
	on Persons (id)
go

create unique index Persons_email_uindex
	on Persons (email)
go

alter table Attendees
	add constraint Attendees_Persons_id_fk
		foreign key (person_id) references Persons
go

create table Addresses
(
	id int identity
		primary key,
	address varchar(255) not null,
	city varchar(255) not null,
	zipcode varchar(255) not null,
	state varchar(255) not null
)
go

create unique index Addresses_id_uindex
	on Addresses (id)
go

alter table Persons
	add constraint Persons_Addresses_id_fk
		foreign key (address_id) references Addresses
go

create table Locations
(
	id int identity
		primary key,
	location varchar(255) not null,
	number_of_rooms int not null
)
go

create unique index Locations_id_uindex
	on Locations (id)
go

alter table Events
	add constraint Events_Locations_id_fk
		foreign key (location_id) references Locations
go

create table Rooms
(
	id int identity
		primary key,
	capacity int not null,
	room_name varchar(255) not null
)
go

create unique index Rooms_id_uindex
	on Rooms (id)
go

create table Courses
(
	id int identity
		primary key,
	title varchar(255) not null,
	description text,
	duration int not null,
	difficulty varchar(255) not null,
	track_id int not null
		constraint Courses_Tracks_id_fk
			references Tracks
)
go

create unique index Courses_id_uindex
	on Courses (id)
go

alter table Presentations
	add constraint Presentations_Courses_id_fk
		foreign key (course_id) references Courses
go

create table Schedules
(
	id int identity
		primary key,
	room_id int not null
		constraint Schedules_Rooms_id_fk
			references Rooms,
	presentation_id int not null
		constraint Schedules_Presentations_id_fk
			references Presentations,
	start_time datetime2 not null,
	end_time datetime2 not null
)
go

create unique index Schedules_id_uindex
	on Schedules (id)
go

create table Tables
(
	id int identity
		primary key,
	table varchar(255) not null
)
go

create unique index Tables_id_uindex
	on Tables (id)
go

alter table Sponsors
	add constraint Sponsors_Tables_id_fk
		foreign key (table_id) references Tables
go

