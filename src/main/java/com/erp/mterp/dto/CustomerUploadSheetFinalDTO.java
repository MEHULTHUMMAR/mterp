package com.erp.mterp.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CustomerUploadSheetFinalDTO {
	private List<CustomerLoyaltyWrongSheetDTO> wrongSheetDTO;
	private int totalRows;
	private int totalWrongRows;
	private String wrongSheetMSG;
	private boolean flag;	
	private String filepath;
	public CustomerUploadSheetFinalDTO(List<CustomerLoyaltyWrongSheetDTO> wrongSheetDTO, int totalRows, int totalWrongRows,
			String wrongSheetMSG, boolean flag) {
		super();
		this.wrongSheetDTO = wrongSheetDTO;
		this.totalRows = totalRows;
		this.totalWrongRows = totalWrongRows;
		this.wrongSheetMSG = wrongSheetMSG;
		this.flag = flag;
	}
}
