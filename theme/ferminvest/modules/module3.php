<?php
$params = unserialize($inMod['params']);
?>
<!--class="articles"-->
<div <?php if ($inMod['css_prefix']) { ?>class="<?php echo $inMod['css_prefix']?>" <?php } ?>>
    <?php
    if ($inMod['showtitle']) {
        ?>
        <header>
            <h3 class="title-head"><?php echo $inMod['title'];?></h3>
        </header>
<!--        <b><span class="icon-text">&#9871;</span>--><?php //echo $inMod['title'];?><!--</b>-->

    <?php

    }

    print $inMod['body'] . $inMod['jscode'];
    ?>
    </div>
