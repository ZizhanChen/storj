-- AUTOGENERATED BY gopkg.in/spacemonkeygo/dbx.v1
-- DO NOT EDIT
CREATE TABLE users (
	id BLOB NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL,
	password_hash BLOB NOT NULL,
	created_at TIMESTAMP NOT NULL,
	PRIMARY KEY ( id ),
	UNIQUE ( email )
);
CREATE TABLE companies (
	id BLOB NOT NULL,
	user_id BLOB NOT NULL REFERENCES users( id ) ON DELETE CASCADE,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
	country TEXT NOT NULL,
	city TEXT NOT NULL,
	state TEXT NOT NULL,
	postal_code TEXT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	PRIMARY KEY ( id )
);
CREATE TABLE projects (
	id BLOB NOT NULL,
	owner_id BLOB REFERENCES users( id ) ON DELETE SET NULL,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	terms_accepted INTEGER NOT NULL,
	created_at TIMESTAMP NOT NULL,
	PRIMARY KEY ( id )
);
CREATE TABLE project_members (
	id BLOB NOT NULL,
	member_id BLOB NOT NULL REFERENCES users( id ) ON DELETE CASCADE,
	project_id BLOB NOT NULL REFERENCES projects( id ) ON DELETE CASCADE,
	created_at TIMESTAMP NOT NULL,
	PRIMARY KEY ( id )
);