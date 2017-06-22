# coding: shift_jis

#�}�b�v�f�ނ̓Ǎ�
def map_load	

	#�}�b�v�摜�̓Ǎ�
	map = Sprite.new(0, 0, Image.load( "DATA/MAP/map.png"))
	ap1 = Sprite.new(120, 80, Image.load("DATA/MAP/ap.png")); ap2 = Sprite.new(40, 180, Image.load("DATA/MAP/ap.png"))
	ap3 = Sprite.new(160, 170, Image.load("DATA/MAP/ap.png")); ap4 = Sprite.new(220, 230, Image.load("DATA/MAP/ap.png"))
	ap5 = Sprite.new(200, 380, Image.load("DATA/MAP/ap.png")); ap6 = Sprite.new(350, 300, Image.load("DATA/MAP/ap.png"))

	#�t�H���g�T�C�Y
	map_font = Font.new(32)

	return map, ap1, ap2, ap3, ap4, ap5, ap6, map_font
end

#�}�b�v�`�惁�\�b�h(���C��)
def map(font, messagebox, flag)

	map, ap1, ap2, ap3, ap4, ap5, ap6, map_font = map_load

	Input.mouse_enable=(false)

	mouse = Sprite.new(0, 0, Image.load("DATA/MAP/usagi.png"))
	
	#�}�b�v�`�惋�[�v
	Window.loop do

		#�}�E�X�̈ʒu���擾
		mouse.x, mouse.y = Input.mouse_x, Input.mouse_y

		#�}�b�v�̕`��&�n��(�A�N�Z�X�|�C���g)���ƃ}�E�X�̕`��
		map.draw; ap1.draw; ap2.draw; ap3.draw; ap4.draw; ap5.draw; ap6.draw; mouse.draw

		#�e�n��(�A�N�Z�X�|�C���g)�Ƀ}�E�X���ڐG����ƒn���`��
		case mouse

			when ap1
				Window.draw_font(500, 200, "����ꓔ��", font, z:2)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then

					#�u�͂��v�������ƏI��
					if messagebox.Popup("����ꓔ��ɍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6; flag = 5; return flag; end
				end

			when ap2
				Window.draw_font(500, 200, "��̕l", font, z:2)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then

					#�u�͂��v�������ƏI��
					if messagebox.Popup("��̕l�ɍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6; flag = 4; return flag; end
				end

			when ap3
				Window.draw_font(500, 200, "�o�_���", font, z:2)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then

					#�u�͂��v�������ƏI��
					if messagebox.Popup("�o�_��Ђɍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6; flag = 2; return flag; end
				end

			when ap4
				Window.draw_font(500, 200, "����Љw", font, z:2)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then

					#�u�͂��v�������ƏI��
					if messagebox.Popup("����Љw�ɍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6; flag = 3; return flag; end
				end

			when ap5
				Window.draw_font(500, 200, "�{���_��", font, z:2)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then

					#�u�͂��v�������ƏI��
					if messagebox.Popup("�{���_�Ђɍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6; flag = 7; return flag; end
				end

			when ap6
				Window.draw_font(500, 200, "���v�b��", font, z:2)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then

					#�u�͂��v�������ƏI��
					if messagebox.Popup("���v�b���ɍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6; flag = 6; return flag; end
				end
		end

		#�n���i�A�N�Z�X�|�C���g�j�̕`��
		Window.draw_font(500, 450, "�o�_�̚�", font, z:2)

		#�Q�[�����j���[�Ăяo��
		gamemenu_call(messagebox, flag, font); Input.mouse_enable=(false)

		#�G�X�P�[�v�L�[�ŏI��
		exit_message(messagebox)
	end
end
