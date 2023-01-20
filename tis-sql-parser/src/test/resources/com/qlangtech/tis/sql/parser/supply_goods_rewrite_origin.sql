    SELECT
 		g.id,
 		g.entity_id,
 		s.supplier_ids,
 		w.warehouse_ids,
 		gss.self_entity_id_list as self_entity_ids,
 		sic.stock_create_times,
 		sic.stock_info_warehouse_ids,
 		g.bar_code,
 		g.inner_code,
 		g.name,
 		g.short_code,
 		g.spell,
 		g.standard_goods_id,
 		g.standard_bar_code,
 		g.standard_name,
 		g.unit_type,
 		g.package_type,
 		g.category_id,
 		category.inner_code as category_inner_code,
 		g.type,
 		'' as num_unit_id,
 		'' as num_unit_name,
 		'' as weight_unit_id,
 		'' as weight_unit_name,
 		'' as main_unit_id,
 		'' as main_unit_name,
 		'' as sub_unit_id1,
 		'' as sub_unit_name1,
 		'' as sub_unit_conversion1,
 		'' as sub_unit_id2,
 		'' as sub_unit_name2,
 		'' as sub_unit_conversion2,
 		'' as sub_unit_id3,
 		'' as sub_unit_name3,
 		'' as sub_unit_conversion3,
 		'' as sub_unit_id4,
 		'' as sub_unit_name4,
 		'' as sub_unit_conversion4,
 		g.specification,
 		g.server,
 		g.path,
 		g.sort_code,
 		g.period,
 		g.memo,
 		g.origin,
 		'' as price_unit_no,
 		'' as inventory_unit_no,
 		g.percentage,
 		g.has_degree,
 		g.is_sales,
 		g.goods_plate_id,
 		'' as goods_plate_name,
 		g.is_valid,
 		g.create_time,
 		g.op_time,
 		g.last_ver,
 		g.extend_fields,
 		g.apply_time
 	FROM goods g LEFT JOIN supplier_collapse s ON ( g.entity_id = s.entity_id AND g.id = s.goods_id )
 	             LEFT JOIN warehouse_collapse w ON ( g.entity_id = w.self_entity_id AND g.id = w.goods_id )
 	             LEFT JOIN goods_sync_shop gss
 	               on ( g.entity_id = gss.entity_id
 	                    AND gss.is_valid=1
 	                    AND g.id = gss.goods_id
 	                    )
 	             LEFT JOIN stock_info_collapse sic on ( g.entity_id = sic.entity_id AND g.id = sic.goods_id)
 	             LEFT JOIN  category
 	                ON(g.entity_id = category.entity_id AND g.category_id = category.id
 	                   AND category.is_valid=1 )
 	WHERE  g.entity_id is not null
