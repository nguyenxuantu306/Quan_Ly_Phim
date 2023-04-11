use master
go

drop DATABASE if exists [asm_java4]
go

create database [asm_java4]
go

use  asm_java4
go

create table [user]
(
	id				int				primary key identity,
	username		varchar(10)		unique not null,
	[password]		varchar(10)		not null,
	email			varchar(50)		unique not null,
	isAdmin			bit				not null default 0,
	isActive		bit				not null default 1
)
go

create table video
(
	id				int				primary key identity,
	title			nvarchar(255)	not null,
	href			varchar(50)		unique not null,
	poster			varchar(255)	null,
	[views]			int				not null default 0,
	shares			int				not null default 0,
	[description]	nvarchar(255)	not null,
	isActive		bit				not null default 1
)
go

create table history
(
	id				int				primary key identity,
	userId			int				foreign key references [user] (id),
	videoId			int				foreign key references video (id),
	viewedDate		datetime		not null default getDate(),
	isLiked			bit				not null default 0,
	likeDate		datetime		null
)
go

insert into [user] (username, [password], email, isAdmin) values
('xuantu',		'111',		'tunxps21672@fpt.edu.vn',		1),
('bigboss',		'222',		'bigboss@gmail.com',			0)
go

insert into video (title, href, poster, [description]) values
(N'AVENGERS',						'oXIWoUoLoKg',	'https://img.youtube.com/vi/oXIWoUoLoKg/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 1'),
(N'AVENGERS: AGE OF ULTRON',		'JB84y4tNdes',	'https://img.youtube.com/vi/JB84y4tNdes/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 2'),
(N'AVENGERS: INFYNITY WAR',			'DPJNk72hVZU',	'https://img.youtube.com/vi/DPJNk72hVZU/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 3'),
(N'AVENGERS: ENDGAME',				'Bhm2YXwiwnY',	'https://img.youtube.com/vi/Bhm2YXwiwnY/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 4'),
(N'Đen - Mang Tiền Về Cho Mẹ ft. Nguyên Thảo (M/V)',				'PJXm14',	'https://img.youtube.com/vi/PJXm14/maxresdefault.jpg',		N'Đen - Mang Tiền Về Cho Mẹ ft. Nguyên Thảo (M/V)'),
(N'Đen - Trốn Tìm ft. MTV band (M/V)',				'QlpSltr8',	'https://img.youtube.com/vi/QlpSltr8/maxresdefault.jpg',		N'Đen - Trốn Tìm ft. MTV band (M/V)'),
(N'Đen - Một triệu like ft. Thành Đồng (M/V)',				'oigiXW6XyCQ',	'https://img.youtube.com/vi/oigiXW6XyCQ/maxresdefault.jpg',		N'Đen - một triệu like ft. Thành Đồng (M/V)'),
(N'Đen - Lối Nhỏ ft. Phương Anh Đào (M/V)',				'KKc_RMln5UY',	'https://img.youtube.com/vi/KKc_RMln5UY/maxresdefault.jpg',		N'Đen - Lối Nhỏ ft. Phương Anh Đào (M/V)'),
(N'Đen - hai triệu năm ft. Biên (m/v)',				'LSMDNL4n0kM',	'https://img.youtube.com/vi/LSMDNL4n0kM/maxresdefault.jpg',		N'Đen - hai triệu năm ft. Biên (m/v)'),
(N'Đen ft. MIN - Bài Này Chill Phết (M/V)',				'ddaEtFOsFeM',	'https://img.youtube.com/vi/ddaEtFOsFeM/maxresdefault.jpg',		N'Đen ft. MIN - Bài Này Chill Phết (M/V)'),
(N'Đen - Anh Đếch Cần Gì Nhiều Ngoài Em ft. Vũ., Thành Đồng (M/V)',				'KdrbBJNFwGw',	'https://img.youtube.com/vi/KdrbBJNFwGw/maxresdefault.jpg',		N'Đen - Anh Đếch Cần Gì Nhiều Ngoài Em ft. Vũ., Thành Đồng (M/V)'),
(N'Hà Anh Tuấn - Tháng Tư Là Lời Nói Dối Của Em (Official MV)',				'UCXao7aTDQM',	'https://img.youtube.com/vi/UCXao7aTDQM/maxresdefault.jpg',		N'Hà Anh Tuấn - Tháng Tư Là Lời Nói Dối Của Em (Official MV)'),
(N'[Official Lyric Video] Tháng Mấy Em Nhớ Anh? || Hà Anh Tuấn',				'lxFmeBhoA1Y',	'https://img.youtube.com/vi/lxFmeBhoA1Y/maxresdefault.jpg',		N'[Official Lyric Video] Tháng Mấy Em Nhớ Anh? || Hà Anh Tuấn'),
(N'Đen - Luôn yêu đời ft. Cheng (M/V)',				'CnZxamAbSnw',	'https://img.youtube.com/vi/CnZxamAbSnw/maxresdefault.jpg',		N'Đen - Luôn yêu đời ft. Cheng (M/V)'),
(N'Ngọt vc. Đen - Cho Tôi Lang Thang',				'gUr4qp6YGLs',	'https://img.youtube.com/vi/gUr4qp6YGLs/maxresdefault.jpg',		N'Ngọt vc. Đen - Cho Tôi Lang Thang')

go

insert into history (userId, videoId, isLiked, likeDate) values
(2,	1,	1,	getDate()),
(2,	3,	0,	null)
go

select * from [user]
select * from video
select * from history


select v.id, v.title, v.href, sum(cast(h.isLiked as int)) as tatolLike from	video v left join history h on v.id = h.videoId group by v.id, v.title, v.href order by	sum(cast(h.isLiked as int)) desc
go

create proc sp_selectUserLikedVideoByVideoHref(@videoHref varchar(50))
as begin
	select
		u.id, u.username, u.[password], u.email, u.isAdmin, u.isActive
	from
		video v left join history h on v.id = h.videoId
			left join [user] u on h.userId = u.id
	where
		v.href = @videoHref and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1
end

	select
		u.id, u.username, u.[password], u.email, u.isAdmin, u.isActive
	from
		video v left join history h on v.id = h.videoId
			left join [user] u on h.userId = u.id
	where
		v.href = 'JB84y4tNdes' and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1

