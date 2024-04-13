			--- HUONG DAN SU DUNG LOC DO XANH ----
--- Gia tri X : la thu tu dong lua chon Trang Bi. Vi du muon nhan dai lung thi` X = 2
--- Gia tri Y : la thu tu dong cua Ten trang bi. Vi du X = 2 thi Y = 1 se nhan Dai Lung co ten Thien Tam Yeu Dai
--- Gia tri Z : la thu tu dong cua Ngu Hanh trang bi. Vi du X = 2, Y = 1, Z = 4 thi se nhan Dai Lung co ten Thien Tam Yeu Dai he Hoa?
-----------------------------------------------------------------------------------------------------------------------------------

DongCanChon = {1, 4, X, Y, Z }	

ThuocTinh1 = 115 	MaxOP1 = 20 	-- 115 la TocDoDanh, Op can lay la >= 20
ThuocTinh2 = 121 	MaxOP2 = 20 	-- 121 la STVL diem , Op can lay la >= 20
ThuocTinh3 = 126 	MaxOP3 = 30 	-- 126 la STVL % , Op can lay la >= 30%
ThuocTinh4 = 0 		MaxOP4 = 0
ThuocTinh5 = 0		MaxOP5 = 0
ThuocTinh6 = 0		MaxOP6 = 0	-- Thuoc Tinh thu 6 uu tien nen de = 0

--== Muon lay thuoc tinh nao thi ghi so Thuoc Tinh do
--== Khong lay thi ghi so 0

------------ Bang ID thuoc Tinh --------------------------

--		STVL Ngoai Cong (Hien) : 126	Chinh Xac : 166
--		STVL Noi Cong : 168				Bang Sat Noi Cong : 169
--		Hoa Sat Noi Cong : 170			Loi Sat Noi Cong : 171
--		Doc Sat Noi Cong : 172			Hut Sinh Luc : 136
--		Toc Do Danh Ngoai Cong : 115	Hut Noi Luc : 137
--		Phan don can chien : 117		Thoi Gian Phuc Hoi : 113
--		Toc Do Di Chuyen : 111			Khang Tat Ca : 114		
--		The Luc Toi Da : 93				Bo Qua Ne Tranh : 58
--		Sinh Luc Toi Da : 85			Noi Luc Toi Da : 89
--		Phuc Hoi Sinh Luc : 88			Phuc Hoi Noi Luc : 92
--		Phuc Hoi The Luc : 96			Suc Manh : 97
--		STVL Ngoai Cong (An) : 121		Doc Sat Ngoai Cong : 125
--		Bang Sat Ngoai Cong : 123		Hoa Sat Ngoai Cong : 122
--		Loi Sat Ngoai Cong : 124		Chuyen Hoa ST Thanh Noi Luc : 134
--		Phong Thu Vat Ly : 104			Khang Doc : 101
--		Khang Bang : 105				Khang Hoa : 102
--		Sinh Khi : 99					Thoi Gian Lam Choang : 110
--		May Man : 135					Thoi Gian Lam Cham : 106
--		Than Phap : 98					Thoi Gian Trung Doc : 108
--		Khang Loi : 103

















































--=========================== DO XANH ===================================
LocDo_Xanh = true
--====================== DO HOANG KIM MON PHAI ============================
LocDo_HKMP = false

dong1 = 350 			--- vi du DAO THIEU LAM dong 1 la Sinh Luc
dong2 = 40			--- vi du DAO THIEU LAM dong 2 la Toc do Danh
dong3 = 140			--- vi du DAO THIEU LAM dong 3 la STVL %
dong4 = 60			--- vi du DAO THIEU LAM dong 4 la SLVL diem
dong5 = 5			--- vi du DAO THIEU LAM dong 5 la Hut NL 
dong6 = 3 			--- vi du DAO THIEU LAM dong 6 la Nhu lai thien diep
-- NEN NHIN 6 DONG CUA MON DO TRUOC, XONG HAY DIEU CHINH CHO PHU HOP

--============================================================================
szThanChetLib = system.GetScriptFolder().."\\LIB\\LocDo.lua"
IncludeFile(szThanChetLib)


TatQuangCao = false 			-- false la Tat quang cao TSTG TSTT
Ten_VatPham_Or_NPC = "LÖnh bµi T©n Thñ"	-- Ten NPC can doi thoai, hoac ten Lenh bai ho tro o Hanh Trang
VatPham_KhongBan = "LÖnh bµi T©n Thñ" 	-- 1 so Sv khi dis xuat hien vat pham o Hanh Trang, Add ten vao neu muon
nDelay = 300				-- Tri hoan thoi gian click vao menu, co the tang len neu may yeu bi dis game
Ruong_ConTrong = 5 			-- 1 so Sv gioi han Ruong con trong 5 o moi lay duoc do
Nhap_SoLuong = 0 			-- Nhap so luong neu Server yeu cau, neu khong co de so 0


--====================== DO HOANG KIM MON PHAI ============================
LocDo_HKMP = false

dong1 = 350 			--- vi du DAO THIEU LAM dong 1 la Sinh Luc
dong2 = 40			--- vi du DAO THIEU LAM dong 2 la Toc do Danh
dong3 = 140			--- vi du DAO THIEU LAM dong 3 la STVL %
dong4 = 60			--- vi du DAO THIEU LAM dong 4 la SLVL diem
dong5 = 5			--- vi du DAO THIEU LAM dong 5 la Hut NL 
dong6 = 3 			--- vi du DAO THIEU LAM dong 6 la Nhu lai thien diep
-- NEN NHIN 6 DONG CUA MON DO TRUOC, XONG HAY DIEU CHINH CHO PHU HOP