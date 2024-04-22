package com.erp.mterp.dto.contact;

import java.util.List;

import com.erp.mterp.dto.datatable.DataTableResponceDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ContactCustomDatatableMainDTO extends DataTableResponceDTO {

	private long totalRecords;

	private List<ContactCustomDatatableDTO> data;
}
