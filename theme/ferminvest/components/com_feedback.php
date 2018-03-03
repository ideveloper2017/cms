<style type="text/css">


    .error_message{
        font-family: Verdana, Arial, sans-serif;
        font-size: 11pt;
        color: #FF0000;
    }

    .thanks_message{
        font-family: Verdana, Arial, sans-serif;
        font-size: 11pt;
        color: #000000;
    }

    a:link{
        text-decoration:none;
        color: #000000;
    }
    a:visited{
        text-decoration:none;
        color: #000000;
    }
    a:hover{
        text-decoration:none;
        color: #000000;
    }

    .table {
        border-collapse:collapse;
        /*border:1px solid #000000;*/
    }

    .table_header{
        /*border:1px solid #070707;*/
        background-color:#000;
        font-family: Verdana, Arial, sans-serif;
        font-size: 11pt;
        font-weight:bold;
        color: #FFFFFF;
        text-align:center;
        padding:2px;
    }

    .attach_info{
        /*border:1px solid #070707;*/
        /*background-color:#EBEBEB;*/
        font-family: Verdana, Arial, sans-serif;
        font-size: 8pt;
        color: #000000;
        padding:4px;
    }


    .table_body{
        /*border:1px solid #070707;*/
        /*background-color:#EBEBEB;*/
        font-family: Verdana, Arial, sans-serif;
        font-size: 10pt;
        color: #000000;
        padding:2px;
    }

    .table_footer{
        /*border:1px solid #070707;*/
        /*background-color:#C03738;*/
        text-align:center;
        padding:2px;
    }

    /*input,select,textarea {*/
        /*font-family: Verdana, Arial, sans-serif;*/
        /*font-size: 10pt;*/
        /*color: #000000;*/

        /*border:1px solid #000000;*/
    /*}*/

    .copyright {
        border:0px;
        font-family: Verdana, Arial, sans-serif;
        font-size: 9pt;
        color: #000000;
        text-align:right;
    }

    form{
        padding:0px;
        margin:0px;
    }
</style>

<script type="text/javascript">
    var error="";
    e_regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+$/;

    function Checkit(theform) {
        if(theform.yourname.value=="") {
            error+="Вы не ввели своё имя\n";
        }

        if(theform.youremail.value=="") {
            error+="Вы не ввели свой email\n";
        } else if(!e_regex.test(theform.youremail.value)) {
            error+="Неправильный email-адрес\n";
        }

        if(theform.yourmessage.value=="") {
            error+="Вы не ввели Ваше сообщение\n";
        }

        if(error) {
            alert('**При заполнении формы были допушены  ошибки, которые необходимо исправить:**\n\n' + error);
            error="";
            return false;
        } else {
            return true;
        }
    }
</script>

<?php if($display_message) {?>

    <div align="center" class="error_message"><b><?=$display_message;?></b></div>
<?php }?>

<?php if($sent_mail!=true) {?>
    </br>
	<div align="center" class="thanks_message"><?=$headmessage;?></div>
	</br>
<form method="post"  enctype="multipart/form-data" name="phmailer" onsubmit="return Checkit(this);">
<table align="center" class="table">

	<?php if($allowattach > 0) {?>
		<tr>
			<td width="100%" class="attach_info" colspan="2">
				<b>Разрешённые типы файлов:</b> <?=implode($allowtypes, ", ");?><br />
				<b>Максимальный размер одного прикрепляемого файла:</b> <?=$max_file_size?>kb.<br />
				<b>Максимальный размер всех прикрепляемых файлов:</b> <?=$max_file_total?>kb.
			</td>
		</tr>
	<?php }?>

	<tr>
		<td width="30%" class="table_body">Ваши фамилия и имя:</td>
		<td width="70%" class="table_body"><input name="yourname" type="text" size="50" value="<?=stripslashes(htmlspecialchars($yourname));?>" /><span class="error_message">*</span></td>
	</tr>
	<tr>
		<td width="30%" class="table_body">Ваш Email:</td>
		<td width="70%" class="table_body"><input name="youremail" type="text" size="50" value="<?=stripslashes(htmlspecialchars($youremail));?>" /><span class="error_message">*</span></td>
	</tr>
	<tr>
		<td width="30%" class="table_body">Тема:</td>
		<td width="70%" class="table_body">

			<?php if($use_subject_drop AND is_array($subjects)) {?>
					<select name="emailsubject" size="1">
						<?php while(list($key,$val)=each($subjects)) {?>
							<option value="<?=intval($key);?>"><?=htmlspecialchars(stripslashes($val));?></option>

						<?php }?>
					</select>


			<?php } else {?>

				<input name="emailsubject" type="text" size="50" value="<?=stripslashes(htmlspecialchars($emailsubject));?>" />

			<?}?>

		</td>
	</tr>

	<?For($i=1;$i <= $allowattach; $i++) {?>
		<tr>
			<td width="30%" class="table_body">Прикрепить файл:</td>
			<td width="70%" class="table_body"><input name="attachment[]" type="file" size="50" /></td>
		</tr>
	<?}?>

	<tr>
		<td colspan="2" width="100%" class="table_body">Ваше сообщение:<span class="error_message">*</span><br />
			<div align="center">
				<textarea name="yourmessage" rows="8" cols="60"><?=stripslashes(htmlspecialchars($yourmessage));?></textarea>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="100%" class="table_footer">
			<input type="hidden" name="action" value="sending" />
			<input type="submit" value="<?=$submitvalue;?>" /> &nbsp;
			<input type="reset" value="<?=$resetvalue;?>" />
		</td>
	</tr>
</table>
</form>

<?} else {?>
</br>
<div align="center" class="thanks_message"><?=$thanksmessage;?></div>
</br>
</br>
</br>


<center><img src="/modules/mod_feedback/12.gif" title="Сами видите, что почтальон уже несёт к нам Ваше письмо." /></center>

<?}
?>