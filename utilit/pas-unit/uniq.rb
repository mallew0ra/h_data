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

	print ("uniq file name > ")
	ufile = gets().chomp()
	lines = File.readlines(opass)
	out = File.new("#{ufile}", 'a')
	seen = {}

	lines.each do |line|
		if line =~/Include/
			if !seen[line]
				out.puts line
				seen[line] = true
			end
		else
			out.puts line
		end
	end
	out.close
end

start
