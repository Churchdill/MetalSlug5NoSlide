-- ===================================
-- 1. Essential Initialization 
-- ===================================
cpu = manager.machine.devices[":maincpu"]
mem = cpu.spaces["program"] 

local frame = 0 -- We must ensure 'frame' is initialized at the top

-- ===================================
-- 2. Credit Write Tap (Your original working logic RESTORED)
-- ===================================

-- address = 0xD00034 -- Original variable name: address

-- function on_memory_write(offset, data)
--     if offset == address then
--         -- This forces the credit counter to 99, ensuring the game starts
--         return 99
--     end
-- end
-- -- Original variable name: mem_handler
-- mem_handler = mem:install_write_tap(address, address + 1, "writes", on_memory_write)
-- --mem_handler = nil


REG_P1CNT = 0x010fd96
A_BUTTON = 0x1000
NO_BUTTON = 0x0000

-- REG_P1CNT = 0x300000
-- A_BUTTON = 0xefbf
-- NO_BUTTON = 0xffbf


function on_reg_p1cnt_write(offset, data)
    --sliding happens around 1080-1085
    --1082 the button appears
    if frame == 1100 then
        print("SLIDE NOW!@!!@")
        -- could never get this to work

        -- if offset == REG_P1CNT then
        --     print("pressing A")
        --     return A_BUTTON
        -- end
        --emu.pause()
        

        --uncomment this to enable tracing at a specific point

    --     manager.machine.debugger:command(
    --     'trace luatrace-landing-sliding-wtf.txt,,,{ tracelog "D0=%x D1=%x D2=%x D3=%x D4=%x D5=%x D6=%x D7=%x A0=%x A1=%x A2=%x A3=%x A4=%x A5=%x A6=%x PC=%x -- ",d0,d1,d2,d3,d4,d5,d6,d7,a0,a1,a2,a3,a4,a5,a6,pc }'
    --     )
    -- end
    -- if frame == 1200 then
    --     manager.machine.debugger:command("trace off")
    end


end

mem_handler2 = mem:install_write_tap(
    REG_P1CNT,
    REG_P1CNT + 1,
    "writes",
    on_reg_p1cnt_write
)

level_address = 0x10D680 -- 0x04 is final level
--level_address = 0x100BAC -- 0x04 is final level

function on_memory_write2(offset, data)
    -- wait till game is somewhat booted before trying to update level
    if frame > 300 then
        if offset == level_address then
            if data==0000 then
                -- This causes the game to load the last level + final boss
                return 0x0406
            end
        end
    end
end
-- Original variable name: mem_handler
mem_handler3 = mem:install_write_tap(level_address, level_address + 1, "writes", on_memory_write2)

function on_frame_done()
    frame = frame + 1
    
    if frame % 100 == 0 then
        print("Frame milestone: " .. frame)
    end

end

emu.register_frame_done(on_frame_done)