# Stealing ain't cool
${0%/*}/scene

# Killem
{
	# D-Thermal except mtSoC
	resetprop --delete init.svc.thermal
	resetprop --delete init.svc.thermal_manager
	resetprop --delete init.svc.thermalloadalgod
	
 	# Other Thermal if SoC support it
	resetprop --delete init.svc.vendor.thermal-hal-1-0
	resetprop --delete init.svc.vendor.thermal-hal-2-0
	resetprop --delete init.svc.vendor.thermal-engine
 	resetprop --delete init.svc.vendor.thermal.symlinks
  	
	# Xiaomi™ mi_thermald
 	resetprop --delete init.svc.mi_thermald
}&

# Always return success, even if the last write fails
exit 0