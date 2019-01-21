local cfg = require "cfg._cfgs"
local Beans = cfg._beans

local this = cfg.task.task

local mk = cfg._mk.table(this, { { "all", "get", 1 }, }, nil, nil, 
    "taskid", -- int, 任务完成条件类型（id的范围为1-100）
    "name", -- string, 程序用名字
    "desc", -- string, 注释
    "nexttask", -- int
    "completecondition", -- task.completecondition
    "exp"  -- int
    )

mk(1, "杀个怪", "杀怪", 2, Beans.task.completecondition.killmonster(1, 3), 1000)
mk(2, "和npc对话", "和npc对话", 3, Beans.task.completecondition.talknpc(1), 2000)
mk(3, "收集物品", "收集物品", 0, Beans.task.completecondition.collectitem(11, 1), 3000)
mk(4, "杀怪并且收集物品", "杀怪并且收集物品", 0, Beans.task.completecondition.conditionand(Beans.task.completecondition.killmonster(1, 3), Beans.task.completecondition.collectitem(11, 1)), 4000)
mk(5, "杀怪对话并且收集物品", "杀怪对话并且收集物品", 0, Beans.task.completecondition.conditionand(Beans.task.completecondition.conditionand(Beans.task.completecondition.killmonster(1, 3), Beans.task.completecondition.talknpc(1)), Beans.task.completecondition.collectitem(11, 1)), 5000)
mk(6, "聊天并且杀怪", "测试转义符号", 0, Beans.task.completecondition.conditionand(Beans.task.completecondition.chat("葵花宝典,123"), Beans.task.completecondition.killmonster(1, 3)), 5000)

return this
