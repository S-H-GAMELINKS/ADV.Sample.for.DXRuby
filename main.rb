# encoding: shift_jis

#�w�b�_�[�̓Ǎ�
require_relative 'SYSTEM/header'

#�^�C�g����
Window.caption=("DXRuby ADV�T���v��")

#�}�E�X�|�C���^�쐬
mouse = Sprite.new(0, 0, Image.new(10, 10, C_DEFAULT))

#�t�H���g�T�C�Y�̎w��
font = Font.new(26)

#���b�Z�[�W�{�b�N�X����
messagebox = WIN32OLE.new('WScript.Shell')

#���[�g�Ǘ��ϐ�
flag = 99

#���C�����[�v
Window.loop do

	case flag 

		#�^�C�g�����
		when 99
			flag = title(mouse, font, messagebox, flag)

		when 1
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 2
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 3
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 4
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 5
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 6
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 7
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 8
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 9
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 10
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 11
			#�}�b�v�̕`��
			flag = map(font, messagebox, flag)
	end
end
