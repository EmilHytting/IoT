/**
 * @file main.c
 * @author emilm
 * @date 2026-10-27
 * @brief Blink the green LED and echo received UART0 characters
 */

#include "Include/Timer/Timer.h"
#include "Include/UART/UART.h"

#define Upper_Lower_Bit_Value 0x20

static void ConvertReceivedChar(char *ReceivedChar) {
  if ((*ReceivedChar >= 'A' && *ReceivedChar <= 'Z') ||
      (*ReceivedChar >= 'a' && *ReceivedChar <= 'z')) {
    *ReceivedChar ^= Upper_Lower_Bit_Value;
  }
}

int main(void) {
  DDRB |= (1 << GreenLedBit);

  Timer1_Init_ms(500);
  RS232Init();
  SetupUARTFunctionCallbackPointer(ConvertReceivedChar);
  Enable_UART_Receive_Interrupt();
  sei();

  while (1) {
  }
}