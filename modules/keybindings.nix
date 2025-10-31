{ ... }: {
  services.udev.extraHwdb = ''
    evdev:input:b0003v*
      KEYBOARD_KEY_70039=esc # bind capslock to esc
      KEYBOARD_KEY_70029=capslock # bind esc to capslock
      KEYBOARD_KEY_700e6=rightmeta

    evdev:atkbd:dmi:*
      KEYBOARD_KEY_3a=esc # bind capslock to esc
      KEYBOARD_KEY_01=capslock # bind esc to capslock
      KEYBOARD_KEY_b8=rightmeta
  '';
}
