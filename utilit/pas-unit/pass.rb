#!/usr/bin/ruby

def start
	print ("  coose any module:\n\t(1)split log:pass\n\t(2)create log:pass \n")
	mod = gets().chomp()
	if mod == "1" then
		split
	elsif mod == "2"
		join
	else
		start
	end
end

def split
	print("  split login - password\n\n")
	print("  INFILE > ")
	ifile = gets().chomp()
	print("  infile => #{ifile}\n  LOGOUT > ")
	olog = gets().chomp()
	print("  logout => #{olog}\n  PASSOUT > ")
	opass = gets().chomp()
	print("  passout => #{opass}\n  SPLIT_CHAR > ")
	schar = gets().chomp()
	print("  split_char => #{schar}\n")
	lfile = File.new("#{olog}", 'a')
	pfile = File.new("#{opass}", 'a')
	File.open("#{ifile}").each do |line|
		all = line.split(schar)
		l = all[0]
		p = all[1]
		lfile.print ("#{l}\n")
		pfile.print ("#{p}\n")
	end
	lfile.close
	pfile.close
	system ("cat #{opass} | sort | uniq >u-#{opass}")
end

def join

	print("  join login - password\n\n")
	print("  INLOG > ")
	ilog = gets().chomp()
	print("\n  inlog => #{ilog}\n  INPASS > ")
	ipass = gets().chomp()
	print("\n  inpass => #{ipass}\n  OUTFILE > ")
	ofile = gets().chomp()
	print = ("\n passout => #{opass}\n  SPLIT_CHAR > ")
	schar = gets().chomp()
	print = ("\n split_char => #{schar}\n")
	out = File.new("#{ofile}", 'a')
	File.open("#{ilog}").each do |login|
		File.open("#{ipass}").each do |pass|
		out.print ("#{login}#{schar}#{pass}")
		end
	end
	out.close
		
end
start
