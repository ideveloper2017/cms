<div class="most-read-popular">
    <div class="title-most-read-tab">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#mostread" aria-controls="mostread" role="tab" data-toggle="tab">en çok okunan</a></li>
<!--            <li role="presentation"><a href="#popularread" aria-controls="popularread" role="tab" data-toggle="tab">popular</a></li>-->
        </ul>
    </div>
    <div class="content-most-read-tab content-most-read-mr">
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="mostread">
                <div class="most-read-slider">
                    <div class="wrap-item">
                        <?php
                        $item=1;
                        foreach ($hitcontents as $content) {
                        ?>
                        <?php if ($item==1) { ?><div class="item"><?php } ?>
                            <div class="item-most-read">
                                <div class="most-read-thumb">
                                    <a href="<?php echo $content['slug']; ?>"><img src="<?php echo $content['first_image']?$content['first_image']:$content['image']; ?>" alt="" /></a>
                                </div>
                                <div class="most-read-info">
                                    <h3><a href="<?php echo $content['slug']; ?>"><?php echo $content['title'] ?></a></h3>
                                    <span class="most-read-date">
                                        <i class="lnr lnr-clock"></i> <?php echo $content['date']; ?>
                                        <i class="lnr lnr-eye"></i> <?php echo $content['hits']; ?>
                                    </span>

                                </div>
                            </div>
                            <?php
                            if ($item==5){ echo '</div>';$item=1;} else {$item++;}
                            } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





