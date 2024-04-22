package com.erp.mterp.dto.datatable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DataTableResponceDTO {
	public Integer recordsFiltered;
	public Integer recordsTotal;
	public Integer draw;
	public String error;
	public DataTableMetaDTO dataTableMetaDTO;

}
