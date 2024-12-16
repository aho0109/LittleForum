DROP DATABASE IF EXISTS Joyful_Garden_forum;
CREATE DATABASE Joyful_Garden_forum;

use Joyful_Garden_forum;

create table Forummembers(
	forummemberID int not null identity(1,1),
	fnickname nvarchar(50) not null primary key,
	fpassword varchar(20) not null,
	role varchar(10));
insert into Forummembers(fnickname, fpassword, role) values('GamerBee', 123, 'fuser');
insert into Forummembers(fnickname, fpassword, role) values('OilKing', 123, 'fuser');
insert into Forummembers(fnickname, fpassword, role) values('Kakaru', 123, 'fuser');
insert into Forummembers(fnickname, fpassword, role) values('Mago', 123, 'fuser');
insert into Forummembers(fnickname, fpassword, role) values('Yoro', 123, 'fuser');
insert into Forummembers(fnickname, fpassword, role) values('GodEater', 123, 'fadmin');
select * from Forummembers;


create table Mboards(
	mboardID int not null primary key identity(1,1), 
	mboardTitle nvarchar(50) ,
	mbulletin  nvarchar(max) ,
	createTime date,
	isDeleted int not null);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('�ҵ{�Q��', '�D�O�O�W:�аQ�׽ҵ{', 0);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('�ӤH�@�~����', '�D�O�O�W:�аQ�ק@�~', 0);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('���ʮi��', '�D�O�O�W:�аQ�׮i��', 0);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('��y�Q��', '�D�O�O�W:�аQ�װQ��', 0);
select * from Mboards;


create table Sboards(
	sboardID int not null primary key identity(1,1), 
	sboardTitle nvarchar(50),
	sbulletin  nvarchar(max),
	mboardID int  not null foreign key references Mboards(mboardID),
	createTime datetime default getdate(),
	isDeleted int not null);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('�춥�ҵ{', '�l�O���i:�ȯ�Q�ת춥', 1, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('�i���ҵ{', '�l�O���i:�ȯ�Q�ת춥', 1, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('���', '�l�O���i:�ȯ���ɪ��', 2, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('��u�m', '�l�O���i:�ȯ���ɤ�u�m', 2, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('�ӤH�Ŷ�', '�l�O���i:�ȭ��ӤH����', 3, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('�t�ӫŶ�', '�l�O���i:�ȭ��t�ӫŶ�', 3, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('��ج���', '�l�O���i:�U�غشӺ������g', 4, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('�u�����', '�l�O���i:�U�ؤu��}�c����', 4, 0);
select * from Sboards;


create table Posts(
	postID int not null primary key identity(1,1),
	postTitle nvarchar(50) ,
	postContent nvarchar(max) ,
	authorNickname nvarchar(50) not null foreign key references Forummembers(fnickname),
	--authorID int ,
	sboardID int not null foreign key references Sboards(sboardID),
	likesCount int ,
	postTime datetime default getdate(),
	isDeleted int not null);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('����춥A', '<p>�n����<p>', 'GamerBee', 1, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('����춥B', '<p>ť����<p>', 'Yoro', 1, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('����i��X', '<p>���e�u�R��<p>', 'OilKing', 2, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('����i��Y', '<p>�W�Үɶ��u��<p>', 'OilKing', 2, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('����p���', '<p>�n����<p>', 'GamerBee', 3, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('����j���', '<p>ť����<p>', 'Yoro', 3, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�����u�m�C��', '<p>���e�u�R��<p>', 'OilKing', 4, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�����u�m����', '<p>�W�Үɶ��u��<p>', 'OilKing', 4, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�ڪ��Ӯi(������)', '<p>�w��j�a�Y�{<p>', 'GamerBee', 5, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�ڪ��Ӯi(�x�_��)', '<p>�a�I�b�x�_�y�歵�֤���<p>', 'Yoro', 5, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�t�Ӳ��~���s', '<p>�s����Фj�a�h�h����<p>', 'OilKing', 6, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�t�ӦX�@�۶�', '<p>�x�D�����X�@���v<p>', 'OilKing', 6, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�p���ت���', '<p>�����@���Q���Y��<p>', 'GamerBee', 7, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�p��װŪK��', '<p>���Ť~�|�}�G<p>', 'Yoro', 7, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��D����n', '<p>���e�u�R��<p>', 'OilKing', 8, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��ϥΤ߱o', '<p>�W�Үɶ��u��<p>', 'Yoro', 8, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��Yoro�ݪ���~��', '<p>�u��Yoro�ݪ���~��<p>', 'Yoro', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��GamerBee�ݪ���~��', '<p>�u��GamerBee�ݪ���~��<p>', 'GamerBee', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��OilKing�ݪ���~��', '<p>�u��OilKing�ݪ���~��<p>', 'OilKing', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��Kakaru�ݪ���~��', '<p>�u��Kakaru�ݪ���~��<p>', 'Kakaru', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('�u��Mago�ݪ���~��', '<p>�u��Mago�ݪ���~��<p>', 'Mago', 8, 84, 0);
select * from Posts;


create table Replies(
	replyID int not null primary key identity(1,1),
	replyContent nvarchar(max),
	authorNickname nvarchar(50) not null foreign key references Forummembers(fnickname),
	--authorID int ,
	postID int not null foreign key references Posts(postID),�@/*�o�̥i��n�]���i�Hnull*/
	likesCount int ,
	replyTime datetime default getdate(),
	isDeleted int not null);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 2, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 3, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 4, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 5, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 6, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 7, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 8, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 9, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 10, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 11, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 12, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 13, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 14, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'Kakaru', 15, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(�o�O��峹���^��)<p>', 'OilKing', 16, 99, 0);

insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>�^�Х�<p>', 'Mago', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>�^�ФA<p>', 'Mago', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>�^�Ф�<p>', 'Mago', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>�u�ꤧ�f<p>', 'Mago', 5, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>�u�\�S�����H<p>', 'Mago', 10, 99, 0);

insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>Yoro�o���^��<p>', 'Yoro', 10, 99, 0);
select * from Replies;


create table Comments(
	commentID int not null primary key identity(1,1),
	commentContent nvarchar(max) ,
	authorNickname nvarchar(50) not null foreign key references Forummembers(fnickname),
	--authorID int ,
	targetType nvarchar(20) ,
	postID int foreign key references Posts(postID),
	replyID int foreign key references Replies(replyID),
	likesCount int ,
	commentTime datetime default getdate(),
	isDeleted int not null);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 1, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 2, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 3, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 4, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 5, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 6, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 7, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 8, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'OilKing', 'Posts', 9, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'GamerBee', 'Posts', 10, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'GamerBee', 'Posts', 11, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'GamerBee', 'Posts', 12, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'GamerBee', 'Posts', 13, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'GamerBee', 'Posts', 15, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��峹���d��', 'GamerBee', 'Posts', 16, null, 10, 0);

insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 1, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 2, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 3, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 4, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 5, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 6, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 7, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 8, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 9, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 10, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Kakaru', 'Replies', null, 11, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Mago', 'Replies', null, 12, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Mago', 'Replies', null, 13, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Mago', 'Replies', null, 14, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Mago', 'Replies', null, 15, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ъ��d��', 'Mago', 'Replies', null, 16, 10, 0);

insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�ХҪ��d��', 'Mago', 'Replies', null, 17, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�ХҪ��d��', 'Mago', 'Replies', null, 17, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�ФA���d��', 'Yoro', 'Replies', null, 18, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�ФA���d��', 'Yoro', 'Replies', null, 18, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ф����d��', 'Yoro', 'Replies', null, 19, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�O��^�Ф����d��', 'Yoro', 'Replies', null, 19, 10, 0);

insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('�o�OYoro���d��', 'Yoro', 'Posts', 1, null, 10, 0);
select * from Comments;


/*�R����*/
drop table Comments;
drop table Replies;
drop table Posts;
drop table Sboards;
drop table Mboards;
drop table Forummembers;





















/*�H�U�|�L�@��*/
/*�ĤG���q*/


create table Likes(
	likeID int not null primary key identity(1,1),
	MemberID int not null foreign key references Members(MemberID),
	targetType nvarchar(20) not null,
	postID int not null foreign key references Posts(postID),
	replyID int not null foreign key references Replies(replyID),
	commentID int not null foreign key references Comments(commentID),
	likeTime datetime default getdate(),
	isDeleted int not null);
insert into Likes(sboardtitle, sbulletin, adminID) values();

select * from Likes;
drop table Likes;



create table Collections(
	collectID int not null primary key identity(1,1),
	temp_memberID int not null foreign key references Members(MemberID),
	targetType nvarchar(20) not null,
	postID int not null foreign key references Posts(postID),
	replyID int not null foreign key references Replies(replyID),
	collectTime datetime default getdate(),
	isDeleted int not null);
select * from Collections;
insert into Collections(sboardtitle, sbulletin, adminID) values();
drop table Collections;



create table Reports(
	reportID int not null primary key identity(1,1),
	temp_memberID int not null foreign key references Members(MemberID),
	targetType nvarchar(20) not null,
	postID int not null foreign key references Posts(postID),
	replyID int not null foreign key references Replies(replyID),
	commentID int not null foreign key references Comments(commentID),
	reportReson nvarchar(15) not null,
	reportTime datetime default getdate(),
	isDeleted int not null);
select * from Reports;
insert into Reports(sboardtitle, sbulletin, adminID) values();
drop table Reports;



/*�ĤT���q*/



create table LobyChats(
	lobychatID int not null primary key identity(1,1),
	mboardID int  not null foreign key references MBoards(mboardID),
	temp_memberID int not null foreign key references Members(MemberID),
	chatContent text not null,
	sendTime datetime default getdate(),
	isDeleted int not null);
select * from LobyChats;
insert into LobyChats(sboardtitle, sbulletin, adminID) values();
drop table LobyChats;



create table Friendships(
	member01ID int not null foreign key references Members(MemberID),
	member02ID int not null foreign key references Members(MemberID),
	inviteTime datetime default getdate(),
	acceptTime datetime default getdate(),
	isDeleted int not null);
select * from Friendships;
insert into Friendships(sboardtitle, sbulletin, adminID) values();
drop table Friendships;



create table PrivateMessages(
	messageID int not null primary key identity(1,1),
	senderID int not null foreign key references Members(MemberID),
	receiverID int not null foreign key references Members(MemberID),
	messageContent text not null,
	sendTime datetime default getdate(),
	isDeleted int not null);
select * from PrivateMessages;
insert into PrivateMessages(sboardtitle, sbulletin, adminID) values();
drop table PrivateMessages;



/*�R����*/
drop table Comments;drop table Replies;drop table Posts;drop table SBoards;drop table MBoards;
drop table ForumMembers;


drop table Likes;
drop table Collections;
drop table Reports;


drop table LobyChats;
drop table Friendships;
drop table PrivateMessages;
