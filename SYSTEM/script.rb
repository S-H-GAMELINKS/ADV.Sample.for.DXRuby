# encoding: shift_jis

#�X�N���v�g�`�惁�\�b�h
def script_line_draw(line, font)

	#�����ʒu�̏�����
	x = 0; y = 0

	line.each_char do |word|

		Window.draw_font(30 + x, 350 + y, word, font, z:4)

		#�����ʒu����i�߂�
		x += 30

		if x >= 600 then
			x = 0
			y += 30
		end
	end
end

#�X�N���v�g�`��N���X
class Script

	#������
	def initialize(text = "")
		@text = text
		@bg = Sprite.new(0, 350, Image.new(640, 480, C_DEFAULT))
		@char = Sprite.new(0, 350, Image.new(640, 480, C_DEFAULT))
		@bgm = nil
		@se = nil
		@window = Sprite.new(0, 350, Image.new(640, 480, C_BLACK))
	end

	#�X�N���v�g�Ǎ�
	def read(flag)

		case flag
			#�v�����[�O�̓Ǎ�
			when 1
				@text = File.open("DATA/STR/prologue.txt", "r")
			#�o�_���
			when 2
				@text = File.open("DATA/STR/�o�_���.txt", "r")
			#����Љw
			when 3
				@text = File.open("DATA/STR/����Љw.txt", "r")
			#��̕l
			when 4
				@text = File.open("DATA/STR/��̕l.txt", "r")
			#����ꓔ��
			when 5
				@text = File.open("DATA/STR/����ꓔ��.txt", "r")
			#���v�b��
			when 6
				@text = File.open("DATA/STR/���v�b��.txt", "r")
			#�{���_��
			when 7
				@text = File.open("DATA/STR/�{���_��.txt", "r")
			#BAD�G���h
			when 8
				@text = File.open("DATA/STR/BAD.txt", "r")
			#GOOD�G���h
			when 9
				@text = File.open("DATA/STR/GOOD.txt", "r")
			#TRUE�G���h
			when 10
				@text = File.open("DATA/STR/TRUE.txt", "r")
		end

		return @string = @text.read
	end

	#������Ɗe��f�ނ̕`��
	def draw(font, messagebox, flag)

		@string.each_line do |line|

			case line
				when /char\d\d/
					line.chomp!
					@char = Sprite.new(150, 0,Image.load("DATA/CHAR/#{line}.png"))
					line.gsub!(/char\d\d/, "")
				when /bg\d\d/
					line.chomp!
					@bg = Sprite.new(0, 0, Image.load("DATA/BG/#{line}.png"))
					line.gsub!(/bg\d\d/, "")
				when /bgm\d\d/
					line.chomp!
					@bgm = Sound.new("DATA/BGM/#{line}.wav"); @bgm.play
					line.gsub!(/bgm\d\d/, "")
				when /se\d\d/
					line.chomp!
					@se = Sound.new("DATA/SE/#{line}.wav"); @se.play
					line.gsub!(/se\d\d/, "")
				when /EOF/
					line.gsub!(/EOF/, "")
						flag = 11
						return flag
				else
					Window.loop do

						@bg.draw; @char.draw; @window.draw

						script_line_draw(line, font)

						#�G���^�[�L�[�Ŏ��̕�������Ăяo��
						if Input.mouse_push?(M_LBUTTON); break; end

						#�Q�[�����j���[�Ăяo��
						gamemenu_call(messagebox, flag, font)

						#�G�X�P�[�v�L�[�ŏI��
						exit_message(messagebox)
					end
			end
		end
	end
end