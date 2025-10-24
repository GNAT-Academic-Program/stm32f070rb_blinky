with STM32F0X0.RCC;  use STM32F0X0.RCC;
with STM32F0X0.GPIO; use STM32F0X0.GPIO;

procedure Stm32f070rb_Blinky is
begin
   RCC_Periph.AHBENR.IOPBEN := 1;         -- Enable GPIOB clock
   GPIOB_Periph.MODER.Arr (8) := 2#01#;   -- OUTPUT mode
   GPIOB_Periph.OTYPER.OT.Arr (8) := 0;   -- Push-pull
   GPIOB_Periph.PUPDR.Arr (8) := 2#00#;   -- No pull
   GPIOB_Periph.OSPEEDR.Arr (8) := 2#00#; -- Low speed
   GPIOB_Periph.BSRR.BR.Arr (8) := 1;     -- Ensure LED is OFF initially
   loop
      GPIOB_Periph.BSRR.BS.Arr (8) := 1;  -- LED ON
      delay 1.0;
      GPIOB_Periph.BSRR.BR.Arr (8) := 1;  -- LED OFF
      delay 1.0;
   end loop;
end Stm32f070rb_Blinky;
