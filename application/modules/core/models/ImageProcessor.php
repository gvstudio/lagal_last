<?php

class Core_Model_ImageProcessor {

    protected $image;
    protected $type;
    protected $width;
    protected $height;
    protected $filename;
    protected $compression = 90;

    public function __construct($filename) {
        $image_info = getimagesize($filename);
        $this->type = $image_info[2];
        $this->width = $image_info[0];
        $this->height = $image_info[1];

        if ($this->type == IMAGETYPE_JPEG) {
            $this->image = imagecreatefromjpeg($filename);
        } elseif ($this->type == IMAGETYPE_GIF) {
            $this->image = imagecreatefromgif($filename);
        } elseif ($this->type == IMAGETYPE_PNG) {
            $this->image = imagecreatefrompng($filename);
        } elseif ($this->type == IMAGETYPE_BMP) {
            $this->image = imagecreatefromwbmp($filename);
        }

        $this->filename = $filename;
    }

    public function getThumbFileName($filename, $full = false) {
        $pathInfo = pathinfo($filename);

        if ($full) {
            return $pathInfo['dirname'] . DIRECTORY_SEPARATOR . $pathInfo['filename'] . '_small.' . $pathInfo['extension'];
        } else {
            return $pathInfo['filename'] . '_small.' . $pathInfo['extension'];
        }
    }

    public function resizeToMax($maxWidth, $maxHeight) {
        if (($maxHeight < $this->height) || ($maxWidth < $this->width)) {
            if (($maxHeight / $this->height) > ($maxWidth / $this->width)) {
                $this->scale($maxWidth / $this->width);
            } else {
                $this->scale($maxHeight / $this->height);
            }
        }
    }

    function save($filename = null, $imageType = null) {
        if ($filename == null) {
            $filename = $this->filename;
        }

        if ($imageType == null) {
            $imageType = $this->type;
        }

        if ($imageType == IMAGETYPE_JPEG) {
            imagejpeg($this->image, $filename, $this->compression);
        } elseif ($imageType == IMAGETYPE_GIF) {
            imagegif($this->image, $filename);
        } elseif ($imageType == IMAGETYPE_PNG) {
            imagepng($this->image, $filename);
        } elseif ($imageType == IMAGETYPE_BMP) {
            imagewbmp($this->image, $filename);
        }
    }

    public function setCompression($value) {
        $this->compression = $value;
    }

    function resizeToHeight($height) {
        $ratio = $height / $this->height();
        $width = $this->width * $ratio;
        $this->resize($width, $height);
    }

    function resizeToWidth($width) {
        $ratio = $width / $this->width;
        $height = $this->height * $ratio;
        $this->resize($width, $height);
    }

    function scale($scale) {
        $width = $this->width * $scale;
        $height = $this->height * $scale;
        $this->resize($width, $height);
    }

    function resize($width, $height) {
        $new_image = imagecreatetruecolor($width, $height);
        imagecopyresampled($new_image, $this->image, 0, 0, 0, 0, $width, $height, $this->width, $this->height);
        $this->image = $new_image;
    }

}