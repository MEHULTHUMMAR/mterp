package com.erp.mterp.dto.datatable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class DataTableMetaDTO {
	private Integer page;
	private Integer pages;
	private Integer perpage;
	private Integer total;
}
