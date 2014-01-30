-- ENGN3050 Logic Design
-- 2006 Winter
-- Project Template
-- Copyright C 2004, 2005, 2006, 2007 Wai Yung


-- Unit Description
-- 1.   This block generates 1-Hz clock from Altera UP2 onboard clock.
-- 2.   Redesign this block if use Altera development kit other than Altera UP2.


-- Warnings
-- 1.   Do not try to simulate this design in Altera.  It is too slow.
-- 2.   You should simulate the enitre design without this block.
-- 3.   You shoud only test this block on hardware.
-- 4.   Make sure to recompile this design.


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity INT_CLK_GEN is
       port (
             CLK_Y:     in  STD_LOGIC;
             CLK_1HZ_Z: out STD_LOGIC
            );
end INT_CLK_GEN;


architecture BEHAVORIAL of INT_CLK_GEN is

constant CLK_1HZ_HALF_PERIOD: INTEGER := 12587500;
constant CLK_1HZ_RESET_VALUE: INTEGER :=        0;

signal CLK_1HZ_BUF: STD_LOGIC;
signal CLK_1HZ_CNT: INTEGER range CLK_1HZ_RESET_VALUE to CLK_1HZ_HALF_PERIOD;

begin
--  1-Hz Clock Generation
--
P1: process(CLK_1HZ_BUF, CLK_Y)
    begin
        if (rising_edge(CLK_Y)) then
            if (CLK_1HZ_CNT = CLK_1HZ_HALF_PERIOD) then
                CLK_1HZ_BUF <= not(CLK_1HZ_BUF);
                CLK_1HZ_CNT <= CLK_1HZ_RESET_VALUE;
            else
                CLK_1HZ_BUF <= CLK_1HZ_BUF;
                CLK_1HZ_CNT <= CLK_1HZ_CNT + 1;
            end if;

            CLK_1HZ_Z <= CLK_1HZ_BUF;
        else
            null;
        end if;
    end process;

end BEHAVORIAL;