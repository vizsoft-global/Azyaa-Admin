from pathlib import Path

path = Path(r'c:\Users\Lenovo\Desktop\Cursor-Projects\Azyaa-Admin\lib\phase1\inventory\inventory_p_m\inventory_p_m_widget.dart')
text = path.read_text(encoding='utf-8')

# Fix table 3 broken wrap
broken3_start = text.find('                                                                          return _wrapInventoryScrollTable(\n                                                                            fullList: inventoryList,\nemptyWidget: EmptyWidget(')
if broken3_start != -1:
    broken3_mid = text.find('                                                                            );\n                                                                          }\n\n', broken3_start)
    broken3_builder = text.find('                                                                                                                                                      builder: (windowedInventoryList) =>', broken3_start)
    if broken3_mid != -1 and broken3_builder != -1:
        # extract empty widget content
        empty_start = text.find('emptyWidget: EmptyWidget(', broken3_start)
        empty_end = text.find('                                                                            );', empty_start)
        empty_block = text[empty_start:empty_end]
        empty_block = empty_block.replace('emptyWidget: EmptyWidget(', 'emptyWidget: EmptyWidget(', 1)
        # rebuild
        after_builder = text[broken3_builder:]
        table_start = after_builder.find('FlutterFlowDataTable<')
        rest = after_builder[table_start:]
        # find controller3 data line end
        data_end = rest.find('windowedInventoryList,\n')
        rest = rest[data_end + len('windowedInventoryList,\n'):]

        new3 = (
            '                                                                          return _wrapInventoryScrollTable(\n'
            '                                                                            fullList: inventoryList,\n'
            '                                                                            ' + empty_block.strip() + ',\n'
            '                                                                            builder: (windowedInventoryList) =>\n'
            '                                                                                FlutterFlowDataTable<\n'
            '                                                                              InventoryRecord>(\n'
            '                                                                            controller:\n'
            '                                                                                _model.paginatedDataTableController3,\n'
            '                                                                            data:\n'
            '                                                                                windowedInventoryList,\n'
            + rest
        )
        # find end of old broken section - up to columnsBuilder which is in rest already
        old_end = broken3_start + len(text[broken3_start:broken3_builder]) + len(after_builder[:data_end + len('windowedInventoryList,\n')])
        # simpler: replace from broken3_start to just before columnsBuilder
        cols = text.find('                                                                            columnsBuilder: (onSortChanged) =>\n                                                                                [\n                                                                              DataColumn2(\n                                                                                label: DefaultTextStyle.merge(\n                                                                                  softWrap: true,\n                                                                                  child: Row(\n                                                                                    mainAxisSize: MainAxisSize.max,\n                                                                                    children: [\n                                                                                      Container(\n                                                                                        width: 50.0,\n                                                                                        decoration: BoxDecoration(),\n                                                                                        child: Text(\n                                                                                          FFLocalizations.of(context).getText(\n                                                                                            \'8m8l3ulv\'', broken3_start)
        if cols != -1:
            text = text[:broken3_start] + new3 + text[cols:]
            print('fixed table 3')

# Fix table 4
broken4_start = text.find('                                                                          return _wrapInventoryScrollTable(\n                                                                            fullList: lowstockList,\nemptyWidget: EmptyWidget(')
if broken4_start != -1:
    empty_start = text.find('emptyWidget: EmptyWidget(', broken4_start)
    empty_end = text.find('                                                                            );', empty_start)
    empty_block = text[empty_start:empty_end]
    cols4 = text.find('                                                                                            \'xthcd2eq\'', broken4_start)
    if cols4 != -1:
        # back up to columnsBuilder... use paginatedDataTableController4 block
        ctrl4 = text.find('_model.paginatedDataTableController4', broken4_start)
        cols4 = text.find('                                                                            columnsBuilder: (onSortChanged) =>', ctrl4)
        new4 = (
            '                                                                          return _wrapInventoryScrollTable(\n'
            '                                                                            fullList: lowstockList,\n'
            '                                                                            ' + empty_block.strip() + ',\n'
            '                                                                            builder: (windowedLowstockList) =>\n'
            '                                                                                FlutterFlowDataTable<\n'
            '                                                                              InventoryRecord>(\n'
            '                                                                            controller:\n'
            '                                                                                _model.paginatedDataTableController4,\n'
            '                                                                            data:\n'
            '                                                                                windowedLowstockList,\n'
        )
        text = text[:broken4_start] + new4 + text[cols4:]
        print('fixed table 4')

path.write_text(text, encoding='utf-8')
