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
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('課程討論', '主板板規:請討論課程', 0);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('個人作品分享', '主板板規:請討論作品', 0);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('活動展覽', '主板板規:請討論展覽', 0);
insert into Mboards(mboardTitle, mbulletin, isDeleted) values('交流討論', '主板板規:請討論討論', 0);
select * from Mboards;


create table Sboards(
	sboardID int not null primary key identity(1,1), 
	sboardTitle nvarchar(50),
	sbulletin  nvarchar(max),
	mboardID int  not null foreign key references Mboards(mboardID),
	createTime datetime default getdate(),
	isDeleted int not null);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('初階課程', '子板公告:僅能討論初階', 1, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('進階課程', '子板公告:僅能討論初階', 1, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('花束', '子板公告:僅能分享花束', 2, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('手工皂', '子板公告:僅能分享手工皂', 2, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('個人宣傳', '子板公告:僅限個人身分', 3, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('廠商宣傳', '子板公告:僅限廠商宣傳', 3, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('栽種相關', '子板公告:各種種植疑難雜症', 4, 0);
insert into Sboards(sboardTitle, sbulletin, mboardID, isDeleted) values('工具相關', '子板公告:各種工具開箱分享', 4, 0);
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
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於初階A', '<p>好難喔<p>', 'GamerBee', 1, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於初階B', '<p>聽不懂<p>', 'Yoro', 1, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於進階X', '<p>內容真充實<p>', 'OilKing', 2, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於進階Y', '<p>上課時間真長<p>', 'OilKing', 2, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於小花束', '<p>好難喔<p>', 'GamerBee', 3, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於大花束', '<p>聽不懂<p>', 'Yoro', 3, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於手工皂顏色', '<p>內容真充實<p>', 'OilKing', 4, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('關於手工皂香味', '<p>上課時間真長<p>', 'OilKing', 4, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('我的個展(高雄場)', '<p>歡迎大家蒞臨<p>', 'GamerBee', 5, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('我的個展(台北場)', '<p>地點在台北流行音樂中心<p>', 'Yoro', 5, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('廠商產品推廣', '<p>新資材請大家多多分享<p>', 'OilKing', 6, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('廠商合作招募', '<p>徵求長期合作講師<p>', 'OilKing', 6, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('如何栽種玫瑰', '<p>玫瑰一直被鳥吃掉<p>', 'GamerBee', 7, 23, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('如何修剪枝條', '<p>怎麼剪才會漂亮<p>', 'Yoro', 7, 52, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('工具挑選指南', '<p>內容真充實<p>', 'OilKing', 8, 99, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('工具使用心得', '<p>上課時間真長<p>', 'Yoro', 8, 84, 0);

insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('只有Yoro看的到才對', '<p>只有Yoro看的到才對<p>', 'Yoro', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('只有GamerBee看的到才對', '<p>只有GamerBee看的到才對<p>', 'GamerBee', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('只有OilKing看的到才對', '<p>只有OilKing看的到才對<p>', 'OilKing', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('只有Kakaru看的到才對', '<p>只有Kakaru看的到才對<p>', 'Kakaru', 8, 84, 0);
insert into Posts(postTitle, postContent, authorNickname, sboardID, likesCount, isDeleted) values('只有Mago看的到才對', '<p>只有Mago看的到才對<p>', 'Mago', 8, 84, 0);
select * from Posts;


create table Replies(
	replyID int not null primary key identity(1,1),
	replyContent nvarchar(max),
	authorNickname nvarchar(50) not null foreign key references Forummembers(fnickname),
	--authorID int ,
	postID int not null foreign key references Posts(postID),　/*這裡可能要設成可以null*/
	likesCount int ,
	replyTime datetime default getdate(),
	isDeleted int not null);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 2, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 3, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 4, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 5, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 6, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 7, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 8, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 9, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 10, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 11, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 12, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 13, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 14, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'Kakaru', 15, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>(這是對文章的回覆)<p>', 'OilKing', 16, 99, 0);

insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>回覆甲<p>', 'Mago', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>回覆乙<p>', 'Mago', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>回覆丙<p>', 'Mago', 1, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>真實之口<p>', 'Mago', 5, 99, 0);
insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>真蓋特機器人<p>', 'Mago', 10, 99, 0);

insert into Replies(replyContent, authorNickname, postID, likesCount, isDeleted) values('<p>Yoro發表的回覆<p>', 'Yoro', 10, 99, 0);
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
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 1, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 2, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 3, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 4, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 5, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 6, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 7, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 8, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'OilKing', 'Posts', 9, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'GamerBee', 'Posts', 10, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'GamerBee', 'Posts', 11, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'GamerBee', 'Posts', 12, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'GamerBee', 'Posts', 13, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'GamerBee', 'Posts', 15, null, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對文章的留言', 'GamerBee', 'Posts', 16, null, 10, 0);

insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 1, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 2, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 3, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 4, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 5, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 6, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 7, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 8, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 9, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 10, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Kakaru', 'Replies', null, 11, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Mago', 'Replies', null, 12, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Mago', 'Replies', null, 13, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Mago', 'Replies', null, 14, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Mago', 'Replies', null, 15, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆的留言', 'Mago', 'Replies', null, 16, 10, 0);

insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆甲的留言', 'Mago', 'Replies', null, 17, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆甲的留言', 'Mago', 'Replies', null, 17, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆乙的留言', 'Yoro', 'Replies', null, 18, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆乙的留言', 'Yoro', 'Replies', null, 18, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆丙的留言', 'Yoro', 'Replies', null, 19, 10, 0);
insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是對回覆丙的留言', 'Yoro', 'Replies', null, 19, 10, 0);

insert into Comments(commentContent, authorNickname, targetType, postID, replyID, likesCount, isDeleted) values('這是Yoro的留言', 'Yoro', 'Posts', 1, null, 10, 0);
select * from Comments;


/*刪除用*/
drop table Comments;
drop table Replies;
drop table Posts;
drop table Sboards;
drop table Mboards;
drop table Forummembers;





















/*以下尚無作用*/
/*第二階段*/


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



/*第三階段*/



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



/*刪除用*/
drop table Comments;drop table Replies;drop table Posts;drop table SBoards;drop table MBoards;
drop table ForumMembers;


drop table Likes;
drop table Collections;
drop table Reports;


drop table LobyChats;
drop table Friendships;
drop table PrivateMessages;
