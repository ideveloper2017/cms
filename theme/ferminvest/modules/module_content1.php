<?php
$params = unserialize($inMod['params']);
?>
<section class="flat-row <?php if ($inMod['css_prefix']) { ?><?php echo $inMod['css_prefix'] ?>" <?php } ?>>
        <div class="container">
            <div class="row">
<?php
if ($inMod['showtitle']) {
    echo ' <div class="col-md-6 col-md-offset-3">
                        <div class="title-section style1"><h2 class="title">' . $inMod['title'] . '</h2></div></div>';
}

print $inMod['body'] . $inMod['jscode'];
print "</div></div>";
print "</section>";
print " <div class=\"flat-divider d20px\"></div>";
?>