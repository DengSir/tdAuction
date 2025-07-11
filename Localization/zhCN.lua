local L = LibStub('AceLocale-3.0'):NewLocale('tdAuction', 'zhCN')
if not L then
    return
end

-- @import:language=zhCN@
L['Enable ALT-CTRL click to buyout'] = '开启ALT-CTRL点击一口价购买'
L['Auto open price list'] = '自动打开价格列表'
L['Scan price mode'] = '扫描价格模式'
L['Scan all'] = '扫描所有'
L['Scan one page'] = '扫描一页'
L['Enable ALT to sell'] = '开启ALT出售'
L['Default stack size'] = '默认堆叠数量'
L['Full'] = '满'
L['Default auction duration'] = '默认拍卖时长'
L['Ignore'] = '忽略'
L['Duration no deposit'] = '不需要保管费时的拍卖时长'
L['When no price, use merchant price multiply by'] = '当没有价格时，使用商人价格乘以'
L['Start price discount'] = '竞标价折扣'
L['Database'] = '数据库'
L['Clear database'] = '清空数据库'
L['You are sure to clear the database'] = '你确定要清空数据库吗？'
L['Tooltip'] = '鼠标提示'
L['Merchant price'] = '商人价格'
L['Auction price'] = '拍卖价格'
L['Disenchant price'] = '分解价格'
L['When pressed SHIFT, to dislay ...'] = '当按下SHIFT时，显示...'
L['Total price'] = '堆叠价格'
L['Single price'] = '单个价格'
L['Time'] = '时间'
L['Bid price'] = '竞标价'
L['Unit price'] = '一口单价'
L['Bid unit price'] = '竞标单价'

L['Show disenchant info'] = '显示分解详情'
L['Nerver'] = '从不显示'
L['Pressed SHIFT'] = '按下SHIFT时显示'
L['Always'] = '始终显示'

L['Full scan'] = '完整扫描'
L['Start scan'] = '开始扫描'
L['Next available time:'] = '下次可用时间：'
L['in about %s'] = '大约%s之后'
L['Full scaning, elapsed time: %s'] = '正在完整扫描，已用时间：%s'
L['Processing data, elapsed time: %s'] = '正在处理数据，已用时间：%s'
L['Now'] = '现在'
L['Unknown'] = '未知'
L['New'] = '新增'
L['Update'] = '更新'

L['Count'] = '数量'
L['Price'] = '价格'
L['Use merchant price x%d'] = '使用商人价格x%d'
L['No price'] = '没有价格'
L['Use history price'] = '使用历史价格'
L['Choose other price'] = '选择其它价格'

L['Start auction:'] = '开始拍卖：'
L['Toggle column'] = '切换列'

L['Auction price time style'] = '拍卖价格时间样式'
L['Date'] = '日期'
L['Time different'] = '时间差'
L.Export = '导出'

L.TOOLTIP_PREFIX_VENDO = '售价'
L.TOOLTIP_PREFIX_AUCTION = '拍卖'
L.TOOLTIP_PREFIX_DISENCHANT = '分解'
L.TOOLTIP_FULLSCAN_DISABLED =
    [[一个未知的NPC（%s），tdAuction不能确定该拍卖行是否是中立拍卖行。]]

L.EXPORT_HEADER = [["价格","名称","","","可购买"]]
L['1 Year'] = '一年'
L['180 Days'] = '180天'
L['30 Days'] = '30天'
L['7 Days'] = '7天'
L['90 Days'] = '90天'
L['Auto clean database'] = '自动清理数据库'
L.Never = '从不'
-- @locale-fill@

-- @end-import@
