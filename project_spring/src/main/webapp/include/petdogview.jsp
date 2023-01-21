<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

							<tr>
								<td align=center>
									<table style="width:500px;border:0px;">
										<tr>
											<td><span class="span_join_title">중성화</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=left>
												<input type="radio" checked> ${vo.neutering}
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
											<td><span class="span_join_title">반려견 등록</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=left>
												<input type="radio" checked> ${vo.registry}
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
												<input type="radio" checked> ${vo.q1}
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
											<td><span class="span_join_title">Q. 다른 반려동물과의 친화력?</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=left>
												<input type="radio" checked> ${vo.q2}
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
											<td><span class="span_join_title">Q. 잘 짖는 편인가요?</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=left>
												<input type="radio" checked> ${vo.q3}
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
											<td><span class="span_join_title">Q. 분리불안 증세가 있나요?</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=left>
												<input type="radio" checked> ${vo.q4}
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
												<input type="radio" checked> ${vo.q5}
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
												<textarea class="textarea_pet" name="q6" disabled>${vo.q6}</textarea>
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
												<input type="radio" checked> ${vo.q7}
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
												<textarea class="textarea_pet" name="q8" disabled>${vo.q8}</textarea>
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
												<textarea class="textarea_pet" name="q9" disabled>${vo.q9}</textarea>
											</td>
										</tr>
									</table>
								</td>
							</tr>