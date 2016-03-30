<?php 
	require_once("../includes/initialize.php");
	require_once ("theme/frontendTemplate.php");
?>
<?php
	if (logged_in()) {
	?>
	<script type="text/javascript">
		window.location = "<?php echo WEB_ROOT; ?>admin/index.php?page=2";
	</script>
	<?php
	}
?>

<?php
	if (isset($_POST['btnlogin'])) {
		//form has been submitted1
		
		$uname = trim($_POST['uname']);
		$upass = trim($_POST['pass']);
		
		$h_upass = sha1($upass);
		//check if the email and password is equal to nothing or null then it will show message box
		if ($uname == '' OR $upass == '') {
			?>    <script type="text/javascript">
			alert("Invalid Username and Password!");
		</script>
		<?php
			
			} else {
			//it creates a new objects of member
			$user = new User();
			//make use of the static function, and we passed to parameters
			$res = $user::AuthenticateAdmin($uname, $upass);
			//then it check if the function return to true
			if($res == true){
				?>   <script type="text/javascript">
				//then it will be redirected to home.php
				window.location = "<?php echo WEB_ROOT; ?>admin/index.php?page=2";
			</script>
			<?php
				
				
				} else {
				?>    <script type="text/javascript">
				alert("Username or Password Not Registered! Contact Your administrator.");
				window.location = "login.php";
			</script>
			<?php
			}
			
		}
		} else {
		
		$email = "";
		$upass = "";
		
	}
	
?>
<?php include ("sidebar.php"); ?>
