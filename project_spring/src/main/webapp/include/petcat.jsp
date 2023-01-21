<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td align=left width=250px><input class="input_pet" style="width:230px;" name="petname" id="petname" placeholder="이름" maxlength="16"></td>
								<td align=left width=250px><input class="input_pet" style="width:230px;" name="breed" id="breed" placeholder="품종" maxlength="16"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">생년월일</span></td>
								<td><span class="span_join_title">몸무게</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=left width=250px>
									<select class="select_pet" style="width:70px;" name="year" id="year">
										
									</select>
									<select class="select_pet" style="width:70px;" name="month" id="month">
										
									</select>
									<select class="select_pet" style="width:70px;" name="day" id="day">
										
									</select>
								</td>
								<td align=left width=250px><input class="input_pet" style="width:100px;" name="weight" id="weight" maxlength="8">kg</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">성별</span></td>
								<td><span class="span_join_title">중성화</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=left width=250px>
									<input type="radio" name="sex" id="male" value="1" checked> <label for="male">남아</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="sex" id="female" value="2"> <label for="female">여아</label>
								</td>
								<td align=left width=250px>
									<input type="radio" name="neutering" id="neu_y" value="1" checked> <label for="neu_y">예</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="neutering" id="neu_n" value="2"> <label for="neu_n">아니오</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">Q. 다른 사람과의 친화력?</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=left>
									<input type="radio" name="q1" id="q1_1" value="1" checked> <label for="q1_1">매우좋아요</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="q1" id="q1_2" value="2"> <label for="q1_2">좋아요</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="q1" id="q1_3" value="3"> <label for="q1_3">보통</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="q1" id="q1_4" value="4"> <label for="q1_4">수줍어해요</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="q1" id="q1_5" value="5"> <label for="q1_5">공격적이예요</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">Q. 앓고 있는 지병, 다친 경험이 있나요?</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=left>
									<input type="radio" name="q5" id="q5_1" value="1" checked> <label for="q5_1">예</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="q5" id="q5_2" value="2"> <label for="q5_2">아니오</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">Q. 과거에 아팠던 경험이 있다면 적어주세요, 주의해야 할 행동은요?</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td>
									<textarea class="textarea_pet" name="q6"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">Q. 음식 알러지가 있나요?</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=left>
									<input type="radio" name="q7" id="q7_1" value="1" checked> <label for="q7_1">예</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="q7" id="q7_2" value="2"> <label for="q7_2">아니오</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">Q. 있다면 어떤 음식인지 알려주세요.</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td>
									<textarea class="textarea_pet" name="q8"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td><span class="span_join_title">참고사항(식사횟수, 배급량, 주의사항 및 특이사항)</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<textarea class="textarea_pet" name="q9"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><div style="height:30px;"></div></td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:500px;border:0px;">
							<tr>
								<td colspan=2><span class="span_join_title">반려견이 자주 다니는 동물병원을 입력해주세요.<br>위급시 사용될 수 있는 중요한 정보입니다.</span></td>
							</tr>
							<tr>
								<td colspan=2><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td><span class="span_join_title">병원명</span></td>
								<td><span class="span_join_title">전화번호</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=left width=250px><input class="input_pet" style="width:230px;" name="hospital" placeholder="병원명" maxlength="20"></td>
								<td align=left width=250px>
									<select class="select_pet" style="width:70px;" name="tel1">
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="070">070</option>
									</select> -
									<input class="select_pet" style="width:70px;" name="tel2" maxlength="4"> - 
									<input class="select_pet" style="width:70px;" name="tel3" maxlength="4">
								</td>
							</tr>
							<tr>
								<td colspan=2><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td colspan=2><span class="span_join_title">간략주소</span></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td colspan=2><input class="input_pet" style="width:500px;" name="address" placeholder="예) 부산시 동래구 충렬대로"></td>
							</tr>
						</table>
					</td>
				</tr>