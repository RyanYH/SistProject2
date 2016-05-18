<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
   var count = 1;
   var addCount;

   function addInputBox() {
      for (var i = 1; i <= count; i++) {
         if (!document.getElementsByName("test" + i)[0]) {
            addCount = i;
            break;
         } else {
            addCount = count;
         }

      }

      var addStr = "<input type=checkbox name=checkList value="+addCount+">";
      var addadd = "<input type=file name=test"+addCount+" accept=image/* >";

      var table = document.getElementById("dynamic_table");
      var newRow = table.insertRow();

      var newCell = newRow.insertCell();
      var aCell = newRow.insertCell();

      newCell.innerHTML = addStr;
      aCell.innerHTML = addadd;
      count++;
   }
   function subtractInputBox() {
      var table = document.getElementById("dynamic_table");
      var rows = dynamic_table.rows.length;
      var chk = 0;

      if (rows > 1) {
         for (var i = 0; i < document.gForm.checkList.length; i++) {
            if (document.gForm.checkList[i].checked == true) {
               table.deleteRow(i);
               i--;
               count--;
               chk++;
            }
         }

         if (chk <= 0) {
            alert("삭제할 행을 체크해 주세요.");
         }

      } else {
         alert("더이상 삭제할 수 없습니다.");
      }
   }

   function submitbutton() {
      var gform = document.gForm;
      gform.count.value = eval(count);
      gForm.submit();
      return;
   }
   
   function newWrite(){
      location.href = "writeCourse.do?theme"+${param.theme};
   }
</script>
</head>
<body -nLoad="addInputBox()">
<div class="row col-md-12" style="border:4px solid #ddd">
   <h2 align="center">COURSE 업로드</h2>
   <form name="gForm" action="course.do" enctype="multipart/form-data"
      method="post">
      <input type="hidden" name="theme" value=${param.theme }>
      <input type="hidden" name="count">
      <input type="hidden" name="id" value="${sessionScope.vo.id}"/>
         <div id="products" class="row list-group">
            <div class="col-md-8">
            <input type="text" name="title" placeholder="course title" style="border:3px solid #fff;margin-top:20px;"/>
            </div>
            <div class="item  col-md-8">
               <div class="thumbnail">
                  <div class="caption">
                     <div class="row">
                        <div class="col-xs-12 col-md-12">
                              <textarea style="width: 100%; height: 300px;" name="content" placeholder="Write something here"></textarea>
                          <input type="text" name="tag">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="item col-md-4">
               <div class="thumbnail">
                  <div class="caption">
                     <div class="row">
                        <div class="col-xs-12 col-md-12">
                           <table>
                              <tr>
                                 <td>
                                    <table id="dynamic_table" class="col-md-4">
                                       <tr>
                                          <td><input type=checkbox name=checkList value="0"></td>
                                          <td><input type=file name=test0 accept=image/*></td>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>
                           </table>
                           
                        </div>
                        
                     </div>
                  </div>
               </div>
            </div>
            <div class="item col-md-8">
                  <div class="thumbnail">
                     <div class="caption">
                        <div class="row">
                           <div class="col-xs-12 col-md-12">
                                       일정 : <input type="date" id="date" size=15 name="cDate" style="border:1px solid gray"><br><br>
                                       인원 : <select id="inwon" name="inwon" name="inwon" style="border:1px solid gray">
                                     <option value="5">5명</option>
                                     <option value="10">10명</option>
                                     <option value="15">15명</option>
                                     <option value="20">20명</option>
                                 </select><br><br>
                                 주소 : <input type="text" size=28 id="address" name="addr" style="border:1px solid gray">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            <center>
               <div class="item col-md-12">
                  <div class="thumbnail2">
                     <div class="caption">
                        <div class="row">
                           <div class="col-xs-12 col-md-12">
                              <table>
                                 <tr class="col-md-9">
                                    <td colspan="2" align="center" class="col-md-3" ><input
                                       class="btn btn-primary btn-xs" type="button" value="사진추가"
                                       onclick="javascript:addInputBox();" ></td>
                                    <td colspan="2" align="center" class="col-md-3"><input
                                       class="btn btn-primary btn-xs" type="button" value="사진삭제"
                                       onclick="javascript:subtractInputBox();"></td>
                                    <td colspan="2" align="center" class="col-md-3"><input
                                       class="btn btn-primary btn-xs" type="button" value="전송하기"
                                       onclick="javascript:submitbutton();" ></td>
                                 </tr>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </center>
         </div>
      </div>
   </form>
</body>

</html>