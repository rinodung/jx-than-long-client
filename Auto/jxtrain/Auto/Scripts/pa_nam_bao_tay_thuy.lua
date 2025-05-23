path = debug.getinfo(1, "S").source:match("@(.*)$"):match("(.*[/\\])")
loadstring("\27\76\117\97\81\0\1\4\4\4\8\0\9\0\0\0\64\105\110\99\46\108\117\97\0\0\0\0\0\0\0\0\0\0\0\2\3\19\0\0\0\5\0\0\0\69\64\0\0\129\128\0\0\85\128\128\0\28\64\0\1\5\64\1\0\69\128\1\0\28\192\0\1\71\0\1\0\7\192\0\0\5\192\0\0\87\192\65\0\22\128\0\128\5\0\1\0\24\0\66\0\22\64\0\128\36\0\0\0\7\64\2\0\30\0\128\0\10\0\0\0\4\12\0\0\0\73\110\99\108\117\100\101\70\105\108\101\0\4\5\0\0\0\112\97\116\104\0\4\17\0\0\0\92\76\73\66\92\80\65\95\65\117\116\111\46\108\117\97\0\4\7\0\0\0\115\116\97\116\117\115\0\4\4\0\0\0\118\101\114\0\4\6\0\0\0\112\99\97\108\108\0\4\18\0\0\0\103\101\116\67\117\114\114\101\110\116\86\101\114\115\105\111\110\0\1\0\3\0\0\0\0\0\192\91\64\4\12\0\0\0\78\104\97\110\84\114\97\110\103\66\105\0\1\0\0\0\0\0\0\0\4\0\0\0\6\0\0\0\0\0\7\3\5\0\0\0\69\0\0\0\70\64\192\0\129\128\0\0\92\64\0\1\30\0\128\0\3\0\0\0\4\7\0\0\0\115\121\115\116\101\109\0\4\6\0\0\0\80\114\105\110\116\0\4\83\0\0\0\60\98\99\108\114\61\114\101\100\62\60\99\111\108\111\114\61\119\104\105\116\101\62\66\185\110\32\99\199\110\32\110\169\110\103\32\99\202\112\32\108\170\110\32\112\104\105\170\110\32\98\182\110\32\80\65\32\65\117\116\111\32\109\237\105\32\110\104\202\116\32\174\211\32\115\246\32\100\244\110\103\46\0\0\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\6\0\0\0\1\0\0\0\4\0\0\0\97\114\103\0\0\0\0\0\4\0\0\0\0\0\0\0\19\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\6\0\0\0\4\0\0\0\7\0\0\0\0\0\0\0\0\0\0\0") ()

--[[ Template thuoc tinh 
{
    [43] = 1, -- khong the pha huy
    [58] = 2, -- bo qua ne tranh
    [85] = 190, -- sinh luc
    [89] = 190, -- noi luc
    [93] = 190, -- the luc
    [97] = 20, -- suc manh
    [98] = 20, --than phap
    [99] = 20, -- sinh khi
    [100] = 20, -- noi cong
    [88] = 5, -- phuc hoi sinh luc moi nua giay
    [92] = 6, -- phuc hoi noi luc moi nua giay
    [96] = 9, -- phuc hoi the luc moi nua giay
    [101] = 25, -- khang doc
    [102] = 25, -- khang hoa
    [103] = 30, -- khang loi
    [104] = 25, -- ptvl
    [105] = 25, -- khang bang
    [106] = 40, -- tg lam cham
    [108] = 40, -- tg trung doc
    [110] = 40, -- tg lam choang
    [111] = 40, -- toc do di chuyen
    [113] = 40, -- thoi gian phuc hoi
    [115] = 30, -- toc do danh (ngoai cong)
    [116] = 40, -- toc do danh (noi cong)
    [114] = 20, -- khang tat ca
    [117] = 20, -- phan don can chien
    [135] = 1, -- may man %
    [121] = 50, -- stvl diem (dong an)
    [122] = 100, -- hoa sat ngoai cong
    [123] = 100, -- bang sat ngoai cong
    [124] = 100, -- loi sat sat ngoai cong
    [125] = 50, -- doc sat ngoai cong
    [126] = 100, -- stvl % (dong hien)
    [134] = 13, -- chsttnl
    [136] = 8, -- hut sinh luc
    [137] = 8, -- hut noi
    [139] = 1, -- ky nang cua phai do duoc cong them
    [166] = 300, -- ti le cong kich chinh xac
    [168] = 200, -- stvl noi cong
    [169] = 200, -- bang sat noi cong
    [170] = 200, -- hoa sat noi cong
    [171] = 200, -- loi sat noi cong
    [172] = 50,  -- doc sat noi cong
}
--]]

------------------------------------------------
gl_LocDoThongMinh = 0 -- Tat chuc nang loc do thong minh
-- Cau hinh set thuoc tinh loc do thu cong
-- set 1
ThemSetThuocTinh({
    [85] = 190, -- sinh luc
    [89] = 190, -- noi luc
    [93] = 190, -- the luc
    [102] = 25, -- khang hoa
    [99] = 20, -- sinh khi
    [110] = 40, -- tg lam choang
})
-- set 2
ThemSetThuocTinh({
    [85] = 180, -- sinh luc
    [89] = 180, -- noi luc
    [43] = 1, -- khong the pha huy
    [102] = 25, -- khang hoa
    [99] = 20, -- sinh khi
    [110] = 40, -- tg lam choang
})
-- set 3
ThemSetThuocTinh({
    [85] = 180, -- sinh luc
    [93] = 180, -- the luc
    [43] = 1, -- khong the pha huy
    [102] = 25, -- khang hoa
    [99] = 20, -- sinh khi
    [110] = 40, -- tg lam choang
})
-- set 4
ThemSetThuocTinh({
    [85] = 190, -- sinh luc
    [89] = 190, -- noi luc
    [88] = 1, -- phuc hoi sinh luc moi nua giay
    [102] = 25, -- khang hoa
    [99] = 20, -- sinh khi
    [110] = 40, -- tg lam choang
})
-- set 5
ThemSetThuocTinh({
    [85] = 190, -- sinh luc
    [93] = 190, -- the luc
    [88] = 1, -- phuc hoi sinh luc moi nua giay
    [102] = 25, -- khang hoa
    [99] = 20, -- sinh khi
    [110] = 40, -- tg lam choang
})
-- set 6
ThemSetThuocTinh({
    [102] = 23, -- khang hoa
    [134] = 13, -- chsttnl
    [110] = 40, -- tg lam choang
})
-- set 7
ThemSetThuocTinh({
    [85] = 190, -- sinh luc
    [88] = 1, -- phuc hoi sinh luc moi nua giay
    [102] = 25, -- khang hoa
    [134] = 15, -- chsttnl
    [110] = 40, -- tg lam choang
})
-- set 8
ThemSetThuocTinh({
    [85] = 190, -- sinh luc
    [43] = 1, -- khong the pha huy
    [102] = 25, -- khang hoa
    [134] = 15, -- chsttnl
    [110] = 40, -- tg lam choang
})
-- Ket thuc cau hinh set thuoc tinh loc do thu cong

-- Cau hinh loc do chinh xac
-- Auto se chi giu lai nhung item co gia tri tuoc tinh dung bang gia tri tuoc tinh da thiet lap
-- 0: Tat, 1: Mo
gl_LocChinhXac = 1
-- Cau hinh set thuoc tinh loc do chinh xac
-- set 1
ThemSetThuocTinhChinhXac({
    [85] = 199, -- sinh luc
    [89] = 189, -- noi luc
    [93] = 179, -- the luc
    [102] = 25, -- khang hoa
    [110] = 40, -- tg lam choang
    [99] = 20, -- sinh khi
})
-- set 2
ThemSetThuocTinhChinhXac({
    [85] = 199, -- sinh luc
    [93] = 189, -- the luc
    [89] = 179, -- noi luc
    [102] = 25, -- khang hoa
    [110] = 40, -- tg lam choang
    [99] = 20, -- sinh khi
})
-- set 4
ThemSetThuocTinhChinhXac({
    [85] = 200, -- sinh luc
    [89] = 100, -- noi luc
    [88] = 5, -- phuc hoi sinh luc moi nua giay
    [102] = 25, -- khang hoa
    [110] = 40, -- tg lam choang
    [99] = 20, -- sinh khi
})
-- set 5
ThemSetThuocTinhChinhXac({
    [85] = 200, -- sinh luc
    [93] = 100, -- the luc
    [88] = 5, -- phuc hoi sinh luc moi nua giay
    [102] = 25, -- khang hoa
    [110] = 40, -- tg lam choang
    [99] = 20, -- sinh khi
})
-- Ket thuc cau hinh set thuoc tinh loc do chinh xac

-- Cau Hinh Loc Do 5 Hanh
-- 0: Tat, 1: Mo
gl_LocDo5Hanh = 0
DongAn_1(102,110)
DongAn_2(102,110)
-- Ket Thuc Cau Hinh Loc Do 5 Hanh

function main()
    NhanTrangBi(1,4,1,2)
end