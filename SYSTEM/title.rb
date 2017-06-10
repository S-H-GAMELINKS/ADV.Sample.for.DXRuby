# encoding: shift_jis

def title(mouse, font, messagebox, flag)

	#�^�C�g������
	title = Sprite.new(0, 0, Image.load("DATA/BG/TITLE.png"))

	#�e�탁�j���[
	start = Sprite.new(490, 30, Image.new(100, 30, C_DEFAULT))
	load = Sprite.new(490, 90, Image.new(100, 30, C_DEFAULT))
	quit = Sprite.new(490, 150, Image.new(100, 30, C_DEFAULT))

	flag_temp = flag

	#���C�����[�v
	Window.loop do

		#�}�E�X�ʒu�̎擾
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#�^�C�g����ʂ̕`��
		title.draw; start.draw; load.draw; quit.draw

		case mouse
			#START�I�����̏���
			when start
				Window.draw_font(0, 450, "�Q�[�����J�n���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					return flag = 1
				end

			#LOAD�I�����̏���
			when load
				Window.draw_font(0, 450, "�Z�[�u�f�[�^�����[�h���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					flag = savedata_load(font, mouse, messagebox)
					return flag
				end
				
			#QUIT�I�����̏���
			when quit

				#���s���e�̕`��
				Window.draw_font(0, 450, "�Q�[�����I�����܂�", font, color:C_BLACK, z:4)

				#�I���m�F
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("�Q�[�����I�����I�����܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						exit
					end
				end
			else
				if flag_temp != flag then
					return flag
					break
				end
		end

		#�G�X�P�[�v�L�[�ŏI��
		exit_message(messagebox)
	end

	return flag
end