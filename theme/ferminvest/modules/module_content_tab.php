<?php
$params = unserialize($inMod['params']);
?>
    <div class="<?php if ($inMod['css_prefix']) { ?><?php echo $inMod['css_prefix'] ?>" <?php } ?>">
<?php
if ($inMod['showtitle']) {
    echo '<h2 class="title-category-home"><a href="#">' . $inMod['title'] . '</a></h2>';
}
print $inMod['body'] . $inMod['jscode'];
print "</div>";


?>