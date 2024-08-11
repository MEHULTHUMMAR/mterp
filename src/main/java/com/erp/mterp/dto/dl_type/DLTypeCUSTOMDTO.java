package com.erp.mterp.dto.dl_type;

import lombok.Data;

import java.util.List;

@Data
public class DLTypeCUSTOMDTO {
	private int total_count;
    private boolean incomplete_results;
	private List<DLTypeCUSTOMSelectItemDTO> items;
	public DLTypeCUSTOMDTO(int total_count, boolean incomplete_results, List<DLTypeCUSTOMSelectItemDTO> items) {
		super();
		this.total_count = total_count;
		this.incomplete_results = incomplete_results;
		this.items = items;
	}
}
