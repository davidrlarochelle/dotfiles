reload_libs!

require('externals/ci/spreadsheets_collection/sync')
require 'tools/excel_routes/convert_to_template'

Tools::ExcelRoutes::ConvertToTemplate.convert_admin

customer_id = 793

file_path = 'lib/tools/excel_routes/output/Portneuf_Dechet_Template_200019.xlsx'

Externals::Ci::SpreadsheetsCollection::Sync.static_sync(
  customer_id,
  file_path
)

customer_id = 793
file_path = 'lib/tools/excel_routes/output/Portneuf_Recyclage_Template.xlsx'

Externals::Ci::SpreadsheetsCollection::Sync.static_sync(
  customer_id,
  file_path

