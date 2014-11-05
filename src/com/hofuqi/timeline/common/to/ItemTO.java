package com.hofuqi.timeline.common.to;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.hofuqi.timeline.common.util.DateUtil;

/**
 * 计划条目实体类
 * 
 * @author fuqi
 * @date 2014-10-12
 */
public class ItemTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private Long planId;

	private String startTime;

	private String endTime;

	private String remark;

	private Date createdDate;

	private String consumeTime;

	private String rowFlag = "";

	private Long diffSec;
	
	private Long diffMin;

	private static final int ONE_HOUR = 1;
	private static final int TWO_HOUR = 2;
	private static final int THREE_HOUR = 3;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Long getPlanId() {
		return planId;
	}

	public void setPlanId(Long planId) {
		this.planId = planId;
	}

	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getConsumeTime() {
		String ret = "";
		if (this.getEndTime() != null && this.getStartTime() != null) {
			long interval = DateUtil.toDate(this.getEndTime(),
					DateUtil.FORMAT_ONE).getTime()
					- DateUtil.toDate(this.getStartTime(), DateUtil.FORMAT_ONE)
							.getTime();
			long intervalMin = interval / (1000 * 60);
			double intervalHour = 0;
			if (intervalMin > 60) {
				BigDecimal b1 = new BigDecimal(interval);
				BigDecimal b2 = new BigDecimal(1000 * 60 * 60);
				BigDecimal result = b1.divide(b2, 2, BigDecimal.ROUND_HALF_UP);
				intervalHour = result.doubleValue();
				if (intervalHour >= THREE_HOUR) {
					this.rowFlag = "danger";
				} else if (intervalHour >= TWO_HOUR) {
					this.rowFlag = "warning";
				} else if (intervalHour >= ONE_HOUR) {
					this.rowFlag = "success";
				}
				ret = String.valueOf(intervalHour) + "小时";
			} else {
				ret = String.valueOf(intervalMin) + "分";
			}
		}
		return ret;
	}

	public void setConsumeTime(String consumeTime) {
		this.consumeTime = consumeTime;
	}

	public String getStartTimeShort() {
		String ret = "";
		if (StringUtils.isNotBlank(this.startTime)) {
			int lastIndexOf = this.startTime.lastIndexOf(".");
			if (lastIndexOf != -1) {
				this.startTime = this.startTime.substring(0, lastIndexOf);
			}
			String hms = this.startTime.split(" ")[1];
			int lastIndexOf2 = hms.lastIndexOf(":");
			ret = hms.substring(0, lastIndexOf2);
		}
		return ret;
	}

	public String getEndTimeShort() {
		String ret = "";
		if (StringUtils.isNotBlank(this.endTime)) {
			int lastIndexOf = this.endTime.lastIndexOf(".");
			if (lastIndexOf != -1) {
				this.endTime = this.endTime.substring(0, lastIndexOf);
			}
			String hms = this.endTime.split(" ")[1];
			int lastIndexOf2 = hms.lastIndexOf(":");
			ret = hms.substring(0, lastIndexOf2);
		}
		return ret;
	}

	public String getRowFlag() {
		return rowFlag;
	}

	public void setRowFlag(String rowFlag) {
		this.rowFlag = rowFlag;
	}

	public Long getDiffSec() {
		return diffSec;
	}

	public void setDiffSec(Long diffSec) {
		this.diffSec = diffSec;
	}

	public Long getDiffMin() {
		if(this.diffSec != null){
			return this.diffSec / 60;
		}
		return 0L;
	}

	public void setDiffMin(Long diffMin) {
		this.diffMin = diffMin;
	}
	
	

}
