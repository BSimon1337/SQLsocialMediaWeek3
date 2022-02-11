create database if not exists socialMedia;

use socialMedia;

drop table if exists comments;
drop table if exists posts;
drop table if exists userdata;

create table userdata(
user_id int(11) not null auto_increment,
username varchar(20) not null,
password varchar(40) not null,
email varchar(40) not null,
primary key(user_id)
);

create table posts(
post_id int(11) not null auto_increment,
user_id int(11) not null,
time_posted datetime default current_timestamp,
post_content varchar(150),
primary key(post_id),
foreign key (user_id) references userdata(user_id)
);

create table comments(
comment_id int(11) not null auto_increment,
post_id int(11) not null,
user_id int(11) not null,
time_commented datetime default current_timestamp,
primary key(comment_id),
foreign key (user_id) references userdata(user_id),
foreign key (post_id) references posts(post_id)
);
