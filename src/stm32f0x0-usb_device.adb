-------------------------------------------------------------------------------
--                                                                           --
--                              STM32F0 USB                                  --
--                                                                           --
--                  Copyright (C) 2022      Marc PoulhiÃ¨s                    --
--                                                                           --
--    STM32F0 USB is free software: you can redistribute it and/or           --
--    modify it under the terms of the GNU General Public License as         --
--    published by the Free Software Foundation, either version 3 of the     --
--    License, or (at your option) any later version.                        --
--                                                                           --
--    STM32F0 USB is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU       --
--    General Public License for more details.                               --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with STM32F0 USB. If not, see <http://www.gnu.org/licenses/>.    --
--                                                                           --
-------------------------------------------------------------------------------
--
--  SPDX-License-Identifier: GPL-3.0-or-later

package body Stm32f0x0.USB_Device is

   overriding
   procedure Initialize (This : in out UDC) is
   begin
      null;
   end Initialize;

   overriding
   function Request_Buffer
     (This : in out UDC; Ep : EP_Addr; Len : USB.Packet_Size)
      return System.Address is
   begin
      return System.Null_Address;
   end Request_Buffer;

   overriding
   function Valid_EP_Id (This : in out UDC; EP : EP_Id) return Boolean is
   begin
      return Positive (EP) in 0 .. Num_Endpoints - 1;
   end Valid_EP_Id;

   overriding
   procedure Start (This : in out UDC) is
   begin
      null;
   end Start;

   overriding
   procedure Reset (This : in out UDC) is
   begin
      null;
   end Reset;

   overriding
   function Poll (This : in out UDC) return UDC_Event is
   begin
      return No_Event;
   end Poll;

   overriding
   procedure EP_Send_Packet
     (This : in out UDC; Ep : EP_Id; Len : USB.Packet_Size) is
   begin
      null;
   end EP_Send_Packet;

   overriding
   procedure EP_Setup (This : in out UDC; EP : EP_Addr; Typ : EP_Type) is
   begin
      null;
   end EP_Setup;

   overriding
   procedure EP_Ready_For_Data
     (This  : in out UDC;
      EP    : EP_Id;
      Size  : USB.Packet_Size;
      Ready : Boolean := True) is
   begin
      null;
   end EP_Ready_For_Data;

   overriding
   procedure EP_Stall (This : in out UDC; EP : EP_Addr; Set : Boolean := True) is
   begin
      null;
   end EP_Stall;

   overriding
   procedure Set_Address (This : in out UDC; Addr : HAL.UInt7) is
   begin
      null;
   end Set_Address;

   overriding
   function Early_Address (This : UDC) return Boolean is
   begin
      return False;
   end Early_Address;

   function Send_Would_Block (This : UDC; Ep : EP_Id) return Boolean is
   begin
      return False;
   end Send_Would_Block;

   function Allocate_Buffer
     (This : in out UDC; Size : Natural) return Packet_Buffer_Offset is
     use System.Storage_Elements;
   begin
      return Storage_Offset (0);
   end Allocate_Buffer;
end Stm32f0x0.USB_Device;