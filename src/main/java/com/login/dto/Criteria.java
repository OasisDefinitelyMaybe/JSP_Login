package com.login.dto;

public class Criteria {
     // 사용자의 요청 정보가 없는 경우를 대비해 초기값을 설정
	 private int pageNo = 1;        // 사용자의 요청 정보 / 페이지번호
	 private int amount = 10;       // 사용자의 요청 정보 / 페이지당 게시물 수
	 
	 // 페이징 처리를 위한 쿼리문에 사용
	 private int startNo; // 시작번호
	 private int endNo;   // 끝번호
	 
	 // 기본 생성자 
	 public Criteria() {}
	 
	 // 생성자 
	 public Criteria(String pageNo, String amount) {
		
		 try {
			 if(pageNo != null && !"".equals(pageNo)) {
					this.pageNo = Integer.parseInt(pageNo);
				}
				if(amount != null && !"".equals(amount)) {
					this.amount = Integer.parseInt(amount);
				}

			} catch (Exception e) {
				System.out.println("pageNo : " + pageNo);
				System.out.println("amounto : " + amount);
				System.out.println("pageNo, amount값 확인필요 === Exception 예외발생");
			}

			// 시작번호와 끝번호 세팅
			// 끝번호 = 페이지번호 * 페이지당 게시물 수
			endNo = this.pageNo * this.amount;
			// 시작번호 = 끝번호 - ( 페이지당 게시물수 -1)
			startNo = endNo - (this.amount - 1);
		}


		public int getPageNo() {
			return pageNo;
		}

		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}

		public int getStartNo() {
			return startNo;
		}

		public void setStartNo(int startNo) {
			this.startNo = startNo;
		}

		public int getEndNo() {
			return endNo;
		}

		public void setEndNo(int endNo) {
			this.endNo = endNo;
		}


	}